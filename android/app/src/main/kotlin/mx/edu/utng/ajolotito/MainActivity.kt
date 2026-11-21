package mx.edu.utng.ajolotito

import android.Manifest
import android.app.*
import android.content.*
import android.content.pm.PackageManager
import android.os.Build
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private lateinit var canal: MethodChannel
    private var permisoResultado: MethodChannel.Result? = null
    override fun configureFlutterEngine(engine: FlutterEngine) {
        super.configureFlutterEngine(engine)
        canal=MethodChannel(engine.dartExecutor.binaryMessenger,"ajolotito/notificaciones")
        canal.setMethodCallHandler { call,result -> when(call.method){
            "inicializar"->{ crearCanales(); result.success(null) }
            "activas"->result.success(Build.VERSION.SDK_INT<33 || checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS)==PackageManager.PERMISSION_GRANTED)
            "pedirPermiso"->{ if(Build.VERSION.SDK_INT>=33){permisoResultado=result;requestPermissions(arrayOf(Manifest.permission.POST_NOTIFICATIONS),44)}else result.success(true) }
            "mostrar"->{ Notificador.mostrar(this,call.argument<Int>("id")!!,call.argument<String>("titulo")!!,call.argument<String>("cuerpo")!!,call.argument<String>("categoria")!!,call.argument<String>("payload")!!);result.success(null) }
            "programar"->{ programar(call.argument<Int>("id")!!,call.argument<Long>("cuando")!!,call.argument<String>("titulo")!!,call.argument<String>("cuerpo")!!,call.argument<String>("categoria")!!,call.argument<String>("payload")!!);result.success(null) }
            "cancelar"->{ cancelar(call.arguments as Int);result.success(null) }
            "lanzamiento"->result.success(intent?.getStringExtra("payload"))
            "ajustes"->{startActivity(Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS).putExtra(Settings.EXTRA_APP_PACKAGE,packageName));result.success(null)}
            else->result.notImplemented()
        }}
    }
    private fun crearCanales(){ if(Build.VERSION.SDK_INT>=26){val n=getSystemService(NotificationManager::class.java);n.createNotificationChannel(NotificationChannel("cuidado","Cuidado del ajolotito",NotificationManager.IMPORTANCE_HIGH));n.createNotificationChannel(NotificationChannel("sorpresa","Sorpresas",NotificationManager.IMPORTANCE_DEFAULT))}}
    private fun intento(id:Int,t:String,c:String,cat:String,p:String)=PendingIntent.getBroadcast(this,id,Intent(this,ReceptorAviso::class.java).putExtra("id",id).putExtra("titulo",t).putExtra("cuerpo",c).putExtra("categoria",cat).putExtra("payload",p),PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE)
    private fun programar(id:Int,cuando:Long,t:String,c:String,cat:String,p:String){val a=getSystemService(AlarmManager::class.java);val pi=intento(id,t,c,cat,p);try{a.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP,cuando,pi)}catch(_:SecurityException){a.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP,cuando,pi)}}
    private fun cancelar(id:Int){getSystemService(AlarmManager::class.java).cancel(intento(id,"","","cuidado",""));getSystemService(NotificationManager::class.java).cancel(id)}
    override fun onRequestPermissionsResult(r:Int,p:Array<out String>,g:IntArray){super.onRequestPermissionsResult(r,p,g);if(r==44){permisoResultado?.success(g.firstOrNull()==PackageManager.PERMISSION_GRANTED);permisoResultado=null}}
}

class ReceptorAviso:BroadcastReceiver(){override fun onReceive(c:Context,i:Intent){Notificador.mostrar(c,i.getIntExtra("id",0),i.getStringExtra("titulo")?:"Ajolotito",i.getStringExtra("cuerpo")?:"",i.getStringExtra("categoria")?:"cuidado",i.getStringExtra("payload")?:"")}}
object Notificador { fun mostrar(c:Context,id:Int,t:String,b:String,cat:String,p:String){val abrir=PendingIntent.getActivity(c,id,Intent(c,MainActivity::class.java).putExtra("payload",p).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP),PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE);val n=if(Build.VERSION.SDK_INT>=26)Notification.Builder(c,cat)else Notification.Builder(c);n.setSmallIcon(c.applicationInfo.icon).setContentTitle(t).setContentText(b).setContentIntent(abrir).setAutoCancel(true);c.getSystemService(NotificationManager::class.java).notify(id,n.build())} }
