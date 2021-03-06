cmake_minimum_required(VERSION 3.5)

project(v2rayAll LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# QtCreator supports the following variables for Android, which are identical to qmake Android variables.
# Check http://doc.qt.io/qt-5/deployment-android.html for more information.
# They need to be set before the find_package(Qt5 ...) call.

#if(ANDROID)
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
#    if (ANDROID_ABI STREQUAL "armeabi-v7a")
#        set(ANDROID_EXTRA_LIBS
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libcrypto.so
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libssl.so)
#    endif()
#endif()

find_package(Qt5 COMPONENTS Widgets Core Quick LinguistTools REQUIRED)

# 添加所有资源文件
set(TS_FILES v2rayAll_zh_CN.ts)
set(RC_FILES icon.rc v2rayAll.qrc)
# 添加logic文件夹下面的所有文件
include_directories(logic logic/core logic/_learn logic/universal)
aux_source_directory(logic/core CORE)
aux_source_directory(logic/_learn LEARN)
aux_source_directory(logic/universal UNIVERSAL)


if(ANDROID)
    add_library(v2rayAll SHARED
      main.cpp
      ${TS_FILES}
    )
else()
    add_executable(v2rayAll
      main.cpp
      ${CORE}
      ${LEARN}
      ${UNIVERSAL}
      ${RC_FILES}
      ${TS_FILES}
    )
endif()

target_compile_definitions(v2rayAll
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(v2rayAll
  PRIVATE Qt5::Core Qt5::Quick Qt5::Widgets)

qt5_create_translation(QM_FILES ${CMAKE_SOURCE_DIR} ${TS_FILES})
