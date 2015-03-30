package virdomort;

enum ValOrFuncEnum<TValue> {
  Value(v : TValue);
  Func(v : Void -> TValue);
}

abstract ValOrFunc<TValue>(ValOrFuncEnum<TValue>) {
  inline function new(valOrFunc: ValOrFuncEnum<TValue>) {
    this = valOrFunc;
  }

  @:from
  public static function fromValue<TValue>(v : TValue) {
    return new ValOrFunc(Value(v));
  }

  @:from
  public static function fromFunc<TValue>(v : Void -> TValue) {
    return new ValOrFunc(Func(v));
  }

  public function getValue() : TValue {
    return switch this {
      case Value(v) : v;
      case Func(f) : f();
    }
  }
}