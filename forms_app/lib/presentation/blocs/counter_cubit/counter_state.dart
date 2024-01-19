part of 'counter_cubit.dart';

// String name = 'Paco'
// String otroNombre = 'Paco'
// CounterState(0,0) == CounterState(0,0) /// TRUE

class CounterState extends Equatable{
  final int counter;
  final int transactionCount;

  const CounterState({ this.counter = 0, this.transactionCount = 0 });



  copyWith({
    int? counter,
    int? transactionCount,
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount 
  );
  
  @override
 
  List<Object?> get props => [ counter, transactionCount ];


}
