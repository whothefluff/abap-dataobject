"! <p class="shorttext synchronized" lang="EN">Data object copy</p>
class zcl_data_object_copy definition
                           public
                           create public.

  public section.

    "! <p class="shorttext synchronized" lang="EN">Creates an instance that wraps the copy of a data object</p>
    "!
    "! @parameter i_data_object | <p class="shorttext synchronized" lang="EN">Existing data object</p>
    methods constructor
              importing
                i_data_object type data.

    "! <p class="shorttext synchronized" lang="EN">Returns the copied data object</p>
    "!
    "! @parameter r_ref | <p class="shorttext synchronized" lang="EN">Data object reference</p>
    methods ref
              returning
                value(r_ref) type ref to data.

  protected section.

    data a_ref type ref to data.

endclass.
class zcl_data_object_copy implementation.

  method constructor.

    data(new_data_object) = new zcl_anonymous_data_object( i_like = i_data_object )->ref( ).

    assign new_data_object->* to field-symbol(<new_data_object>).

    <new_data_object> = i_data_object.

    me->a_ref = new_data_object.

  endmethod.
  method ref.

    r_ref = me->a_ref.

  endmethod.

endclass.
