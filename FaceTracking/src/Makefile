CFLAGS = -I/usr/local/include
LIBS = -L/usr/local/lib -lopencv_highgui -lopencv_imgproc -lopencv_video -lopencv_legacy -lopencv_objdetect -lopencv_core
CC = g++

SRCS = face_detector.cpp face_tracker.cpp ft_data.cpp patch_model.cpp shape_model.cpp
OBJS = $(SRCS:.cpp=.o)
ALL = annotate trainshape trainfacedet trainfacetrack trainpatch vizfacedet viztracker vizshape vizannot vizpatch
%.o : %.cc
	g++ $(CFLAGS) -c $<

vizpatch: $(OBJS)
	$(CC) $(CFLAGS) $(LIBS) -o vizpatch visualize_patch_model.cpp $(OBJS)

vizannot: $(OBJS)
	$(CC) $(CFLAGS) $(LIBS) -o vizannot visualize_annotations.cpp $(OBJS)

vizshape: $(OBJS)
	$(CC) $(CFLAGS) $(LIBS) -o vizshape visualize_shape_model.cpp $(OBJS)

viztracker: $(OBJS)
	$(CC) $(CFLAGS) $(LIBS) -o viztracker visualize_face_tracker.cpp $(OBJS)

vizfacedet: $(OBJS)
	$(CC) $(CFLAGS) $(LIBS) -o vizfacedet visualize_face_detector.cpp $(OBJS)

trainpatch: $(OBJS)
	$(CC) $(CFLAGS) $(LIBS) -o trainpatch train_patch_model.cpp $(OBJS)

trainfacetrack: $(OBJS)
	$(CC) $(CFLAGS) $(LIBS) -o trainfacetrack  train_face_tracker.cpp $(OBJS)

trainfacedet: $(OBJS)
	$(CC) $(CFLAGS) $(LIBS) -o trainfacedet  train_face_detector.cpp $(OBJS)

trainshape: $(OBJS)
	$(CC) $(CFLAGS) $(LIBS) -o trainshape  train_shape_model.cpp $(OBJS)

annotate: $(OBJS)
	$(CC) $(CFLAGS) $(LIBS) -o annotate annotate.cpp $(OBJS)

all: $(ALL)

clean:
	rm -f *.o $(ALL)
