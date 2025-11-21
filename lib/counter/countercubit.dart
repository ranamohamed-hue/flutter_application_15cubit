import 'package:bloc/bloc.dart';
import 'package:flutter_application_15cubit/counter/counterstates.dart';

class Countercubit extends Cubit<Counterstates>{
  Countercubit(): super(CounterInitial());
  int counter=0;
  void increament(){
    counter++;
    emit(Counterincreament());
  }
void decreament(){
  counter--;
  emit(Counterdecreament());
}
void reset(){
  counter=0;
  emit(Counterrefresh());
}
}