//Generated by the protocol buffer compiler. DO NOT EDIT!
// source: usermgmt/usermgmt.proto

package usermgmt;

@kotlin.jvm.JvmSynthetic
public inline fun newUser(block: usermgmt.NewUserKt.Dsl.() -> kotlin.Unit): usermgmt.Usermgmt.NewUser =
  usermgmt.NewUserKt.Dsl._create(usermgmt.Usermgmt.NewUser.newBuilder()).apply { block() }._build()
public object NewUserKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  public class Dsl private constructor(
    private val _builder: usermgmt.Usermgmt.NewUser.Builder
  ) {
    public companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: usermgmt.Usermgmt.NewUser.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): usermgmt.Usermgmt.NewUser = _builder.build()

    /**
     * <code>string name = 1;</code>
     */
    public var name: kotlin.String
      @JvmName("getName")
      get() = _builder.getName()
      @JvmName("setName")
      set(value) {
        _builder.setName(value)
      }
    /**
     * <code>string name = 1;</code>
     */
    public fun clearName() {
      _builder.clearName()
    }

    /**
     * <code>int32 age = 2;</code>
     */
    public var age: kotlin.Int
      @JvmName("getAge")
      get() = _builder.getAge()
      @JvmName("setAge")
      set(value) {
        _builder.setAge(value)
      }
    /**
     * <code>int32 age = 2;</code>
     */
    public fun clearAge() {
      _builder.clearAge()
    }
  }
}
@kotlin.jvm.JvmSynthetic
public inline fun usermgmt.Usermgmt.NewUser.copy(block: usermgmt.NewUserKt.Dsl.() -> kotlin.Unit): usermgmt.Usermgmt.NewUser =
  usermgmt.NewUserKt.Dsl._create(this.toBuilder()).apply { block() }._build()
