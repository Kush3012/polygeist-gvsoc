module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i128, dense<128> : vector<2xi32>>, #dlti.dl_entry<i8, dense<[8, 32]> : vector<2xi32>>, #dlti.dl_entry<i16, dense<[16, 32]> : vector<2xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>, #dlti.dl_entry<"dlti.endianness", "little">>, llvm.data_layout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128", llvm.target_triple = "aarch64-unknown-linux-gnu", "polygeist.target-cpu" = "generic", "polygeist.target-features" = "+fp-armv8,+neon,+outline-atomics,+v8a,-fmv"} {
  memref.global "private" @thread_seen : memref<8xi32> = uninitialized
  func.func @kernel_test() attributes {llvm.linkage = #llvm.linkage<external>} {
    %c1_i32 = arith.constant 1 : i32
    %0 = memref.get_global @thread_seen : memref<8xi32>
    affine.parallel (%arg0) = (0) to (8) {
      affine.store %c1_i32, %0[%arg0] : memref<8xi32>
    }
    return
  }
  func.func @main() -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %c1_i32 = arith.constant 1 : i32
    %c8_i32 = arith.constant 8 : i32
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @thread_seen : memref<8xi32>
    affine.for %arg0 = 0 to 8 {
      affine.store %c0_i32, %0[%arg0] : memref<8xi32>
    }
    affine.parallel (%arg0) = (0) to (8) {
      affine.store %c1_i32, %0[%arg0] : memref<8xi32>
    }
    %1 = affine.for %arg0 = 0 to 8 iter_args(%arg1 = %c0_i32) -> (i32) {
      %4 = affine.load %0[%arg0] : memref<8xi32>
      %5 = arith.addi %arg1, %4 : i32
      affine.yield %5 : i32
    }
    %2 = arith.cmpi ne, %1, %c8_i32 : i32
    %3 = arith.extui %2 : i1 to i32
    return %3 : i32
  }
}
