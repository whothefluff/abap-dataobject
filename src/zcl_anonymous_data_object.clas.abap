"! <p class="shorttext synchronized" lang="EN">Anonymous data object</p>
class zcl_anonymous_data_object definition
                                public
                                create public.

  public section.

    "! <p class="shorttext synchronized" lang="EN">Creates an instance that wraps a new anonymous data object</p>
    "!
    "! @parameter i_like | <p class="shorttext synchronized" lang="EN">Use an existing data object</p>
    "! @parameter i_type | <p class="shorttext synchronized" lang="EN">Use a data type</p>
    methods constructor
              importing
                i_like type data optional
                i_type type ref to cl_abap_datadescr optional.

    "! <p class="shorttext synchronized" lang="EN">Returns the wrapped data object</p>
    "!
    "! @parameter r_ref | <p class="shorttext synchronized" lang="EN">Data object reference</p>
    methods ref
              returning
                value(r_ref) type ref to data.

  protected section.

    data a_ref type ref to data.

endclass.
class zcl_anonymous_data_object implementation.

  method constructor.

    if ( i_like is not initial and i_type is bound )
       or ( i_like is initial and i_type is not bound ).

      raise exception type zcx_no_check.

    endif.

    if i_like is not initial.

      create data me->a_ref like i_like.

    elseif i_type is bound.

      create data me->a_ref type handle i_type.

    endif.

  endmethod.
  method ref.

    r_ref = me->a_ref.

  endmethod.

endclass.
