module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<i8, dense<[8, 32]> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<i16, dense<[16, 32]> : vector<2xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i128, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>>, llvm.data_layout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128", llvm.target_triple = "aarch64-unknown-linux-gnu", "polygeist.target-cpu" = "generic", "polygeist.target-features" = "+fp-armv8,+neon,+outline-atomics,+v8a,-fmv"} {
  memref.global "private" @done_flags : memref<8xi32> = uninitialized
  func.func @_worker_entry() attributes {llvm.linkage = #llvm.linkage<external>} {
    %c1_i32 = arith.constant 1 : i32
    %c8_i32 = arith.constant 8 : i32
    %c31_i32 = arith.constant 31 : i32
    %0 = llvm.mlir.undef : i32
    %1 = arith.andi %0, %c31_i32 : i32
    %2 = arith.index_cast %1 : i32 to index
    %3 = arith.cmpi slt, %1, %c8_i32 : i32
    scf.if %3 {
      %4 = memref.get_global @done_flags : memref<8xi32>
      affine.store %c1_i32, %4[symbol(%2)] : memref<8xi32>
    }
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb1
    cf.br ^bb1
  }
  func.func @main() -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %true = arith.constant true
    %false = arith.constant false
    %c255_i32 = arith.constant 255 : i32
    %c270532616_i32 = arith.constant 270532616 : i32
    %c4_i32 = arith.constant 4 : i32
    %c270532672_i32 = arith.constant 270532672 : i32
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %0 = llvm.mlir.undef : i32
    %1 = memref.get_global @done_flags : memref<8xi32>
    affine.for %arg0 = 0 to 8 {
      affine.store %c0_i32, %1[%arg0] : memref<8xi32>
    }
    %2 = "polygeist.get_func"() <{name = @_worker_boot}> : () -> !llvm.ptr
    %3 = llvm.ptrtoint %2 : !llvm.ptr to i32
    affine.for %arg0 = 0 to 8 {
      %7 = arith.index_cast %arg0 : index to i32
      %8 = arith.muli %7, %c4_i32 : i32
      %9 = arith.addi %8, %c270532672_i32 : i32
      %10 = llvm.inttoptr %9 : i32 to !llvm.ptr
      llvm.store %3, %10 : i32, !llvm.ptr
    }
    %4 = llvm.inttoptr %c270532616_i32 : i32 to !llvm.ptr
    llvm.store %c255_i32, %4 : i32, !llvm.ptr
    %5:3 = affine.for %arg0 = 0 to 100000 iter_args(%arg1 = %true, %arg2 = %0, %arg3 = %true) -> (i1, i32, i1) {
      %7:3 = scf.if %arg3 -> (i1, i32, i1) {
        %8:2 = affine.for %arg4 = 0 to 8 iter_args(%arg5 = %c1_i32, %arg6 = %true) -> (i32, i1) {
          %13:2 = scf.if %arg6 -> (i32, i1) {
            %14 = affine.load %1[%arg4] : memref<8xi32>
            %15 = arith.cmpi eq, %14, %c0_i32 : i32
            %16 = arith.select %15, %c0_i32, %arg5 : i32
            %17 = arith.cmpi ne, %14, %c0_i32 : i32
            scf.yield %16, %17 : i32, i1
          } else {
            scf.yield %arg5, %false : i32, i1
          }
          affine.yield %13#0, %13#1 : i32, i1
        }
        %9 = arith.cmpi eq, %8#0, %c0_i32 : i32
        %10 = arith.cmpi ne, %8#0, %c0_i32 : i32
        %11 = arith.andi %9, %arg1 : i1
        %12 = arith.select %10, %c0_i32, %arg2 : i32
        scf.yield %11, %12, %9 : i1, i32, i1
      } else {
        scf.yield %arg1, %arg2, %false : i1, i32, i1
      }
      affine.yield %7#0, %7#1, %7#2 : i1, i32, i1
    }
    %6 = arith.select %5#0, %c1_i32, %5#1 : i32
    return %6 : i32
  }
  func.func private @_worker_boot() attributes {llvm.linkage = #llvm.linkage<external>}
}
