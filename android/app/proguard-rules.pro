# Fix SLF4J issue from Pusher
-keep class org.slf4j.** { *; }
-dontwarn org.slf4j.**

-keep class com.dexterous.flutterlocalnotifications.** { *; }