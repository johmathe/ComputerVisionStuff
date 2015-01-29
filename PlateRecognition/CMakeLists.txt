cmake_minimum_required (VERSION 2.6) 

PROJECT(ANPR)
SET(PROJECT_VERSION "0.1")

# Opencv Package
FIND_PACKAGE( OpenCV REQUIRED )
IF (${OpenCV_VERSION} VERSION_LESS 2.3.0)
	MESSAGE(FATAL_ERROR "OpenCV version is not compatible : ${OpenCV_VERSION}")
ENDIF()

SET(SRC
 main.cc
 detect_regions.cc
 ocr.cc
 Plate.cc
)

ADD_EXECUTABLE( ${PROJECT_NAME} ${SRC} )
TARGET_LINK_LIBRARIES( ${PROJECT_NAME}  ${OpenCV_LIBS} )

ADD_EXECUTABLE( train_svm train_svm.cc )
TARGET_LINK_LIBRARIES( train_svm  ${OpenCV_LIBS} )

ADD_EXECUTABLE( train_ocr train_ocr.cc ocr.cc )
TARGET_LINK_LIBRARIES( train_ocr  ${OpenCV_LIBS} )

ADD_EXECUTABLE( eval_ocr eval_ocr.cc ocr.cc )
TARGET_LINK_LIBRARIES( eval_ocr  ${OpenCV_LIBS} )

SET(RESOURCES
	README.txt
	svm.xml
	ocr.xml
	test
)
foreach(f ${RESOURCES})
file( COPY ${f} DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/)
endforeach(f)
