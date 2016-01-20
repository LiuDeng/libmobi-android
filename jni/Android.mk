LOCAL_PATH := $(call my-dir)
#清空变量缓存
include $(CLEAR_VARS)
#模块名称
LOCAL_MODULE := hello-jni
#包含源码
LOCAL_SRC_FILES :=  go.c \
                    ./libmobi/buffer.c \
					./libmobi/encryption.c	\
					./libmobi/miniz.c \
					./libmobi/read.c \
					./libmobi/write.c \
					./libmobi/compression.c	\
					./libmobi/index.c \
					./libmobi/opf.c	\
					./libmobi/structure.c \
					./libmobi/debug.c \
					./libmobi/memory.c \
					./libmobi/parse_rawml.c \
					./libmobi/util.c
LOCAL_WHOLE_STATIC_LIBRARIES += android_support
LOCAL_CFLAGS += -std=c99
LOCAL_C_FLAGS := -Wimplicit-function-declaration
#头文件搜索路径
LOCAL_C_INCLUDES := $(LOCAL_PATH)/libxml2/include/
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libmobi
LOCAL_STATIC_LIBRARIES := libxml2
#依赖库
LOCAL_LDLIBS := -llog \
                -lz \
                -ldl 
#编译成So
include $(BUILD_SHARED_LIBRARY)
include $(LOCAL_PATH)/libxml2/Android.mk
$(call import-module,android/support)

