// Copyright © Aptos Foundation

use crate::natives::transaction_context::NativeTransactionContext;
use aptos_native_interface::{
    RawSafeNative, SafeNativeBuilder, SafeNativeContext, SafeNativeResult,
};
use better_any::{Tid, TidAble};
use move_vm_runtime::native_functions::NativeFunction;
use move_vm_types::{loaded_data::runtime_types::Type, values::Value};
use smallvec::{smallvec, SmallVec};
use std::collections::VecDeque;

/// A txn-local counter that increments each time a random 32-byte blob is requested.
#[derive(Tid, Default)]
pub struct RandomnessContext {
    txn_local_state: Vec<u8>, //   8-byte counter
}

impl RandomnessContext {
    pub fn new() -> Self {
        Self {
            txn_local_state: vec![0; 8],
        }
    }

    pub fn increment(&mut self) {
        for byte in self.txn_local_state.iter_mut() {
            if *byte < 255 {
                *byte += 1;
                break;
            } else {
                *byte = 0;
            }
        }
    }
}

pub fn fetch_and_increment_txn_counter(
    context: &mut SafeNativeContext,
    _ty_args: Vec<Type>,
    _args: VecDeque<Value>,
) -> SafeNativeResult<SmallVec<[Value; 1]>> {
    // TODO: charge gas?
    let rand_ctxt = context.extensions_mut().get_mut::<RandomnessContext>();
    let ret = rand_ctxt.txn_local_state.to_vec();
    rand_ctxt.increment();
    Ok(smallvec![Value::vector_u8(ret)])
}

pub fn is_safe_call(
    context: &mut SafeNativeContext,
    _ty_args: Vec<Type>,
    _args: VecDeque<Value>,
) -> SafeNativeResult<SmallVec<[Value; 1]>> {
    let ctx = context.extensions().get::<NativeTransactionContext>();
    // TODO: charge gas?
    Ok(smallvec![Value::bool(
        ctx.get_is_friend_or_private_entry_func()
    )])
}

pub fn make_all(
    builder: &SafeNativeBuilder,
) -> impl Iterator<Item = (String, NativeFunction)> + '_ {
    let natives = vec![
        (
            "fetch_and_increment_txn_counter",
            fetch_and_increment_txn_counter as RawSafeNative,
        ),
        ("is_safe_call", is_safe_call),
    ];

    builder.make_named_natives(natives)
}
