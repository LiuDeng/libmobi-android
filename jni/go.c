#include <libxml/encoding.h>
#include <mobi.h>
#include <jni.h>
/****
* GetMobi LIbrary Version
*/
const char * getMobiVersion(){
	return mobi_version();
}

JNIEXPORT jstring JNICALL Java_com_ckdroid_mobi_MainActivity_getVersion(JNIEnv *env, jclass type) {
    return (*env)->NewStringUTF(env, getMobiVersion());
}
