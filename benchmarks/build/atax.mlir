module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i128, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<i8, dense<[8, 32]> : vector<2xi32>>, #dlti.dl_entry<i16, dense<[16, 32]> : vector<2xi32>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>, #dlti.dl_entry<"dlti.endianness", "little">>, llvm.data_layout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128", llvm.target_triple = "aarch64-unknown-linux-gnu", "polygeist.target-cpu" = "generic", "polygeist.target-features" = "+fp-armv8,+neon,+outline-atomics,+v8a,-fmv"} {
  func.func @main() -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %cst = arith.constant 3.200000e+01 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %c1_i32 = arith.constant 1 : i32
    %true = arith.constant true
    %cst_1 = arith.constant 0.000000e+00 : f32
    %c32_i32 = arith.constant 32 : i32
    %alloca = memref.alloca() : memref<32xf32>
    %alloca_2 = memref.alloca() : memref<32xf32>
    %alloca_3 = memref.alloca() : memref<32xf32>
    %alloca_4 = memref.alloca() : memref<32x32xf32>
    %cast = memref.cast %alloca_4 : memref<32x32xf32> to memref<?x32xf32>
    %cast_5 = memref.cast %alloca_3 : memref<32xf32> to memref<?xf32>
    affine.for %arg0 = 0 to 32 {
      %4 = arith.index_cast %arg0 : index to i32
      %5 = arith.sitofp %4 : i32 to f32
      %6 = arith.divf %5, %cst : f32
      %7 = arith.addf %6, %cst_0 : f32
      affine.store %7, %alloca_3[%arg0] : memref<32xf32>
    }
    affine.for %arg0 = 0 to 32 {
      %4 = arith.index_cast %arg0 : index to i32
      affine.for %arg1 = 0 to 32 {
        %5 = arith.index_cast %arg1 : index to i32
        %6 = arith.addi %5, %c1_i32 : i32
        %7 = arith.muli %4, %6 : i32
        %8 = arith.sitofp %7 : i32 to f32
        %9 = arith.divf %8, %cst : f32
        affine.store %9, %alloca_4[%arg0, %arg1] : memref<32x32xf32>
      }
    }
    %cast_6 = memref.cast %alloca_2 : memref<32xf32> to memref<?xf32>
    %cast_7 = memref.cast %alloca : memref<32xf32> to memref<?xf32>
    call @kernel_atax(%c32_i32, %c32_i32, %cast, %cast_5, %cast_6, %cast_7) : (i32, i32, memref<?x32xf32>, memref<?xf32>, memref<?xf32>, memref<?xf32>) -> ()
    %0 = affine.for %arg0 = 0 to 32 iter_args(%arg1 = %cst_1) -> (f32) {
      %4 = affine.load %alloca_2[%arg0] : memref<32xf32>
      %5 = arith.addf %arg1, %4 : f32
      affine.yield %5 : f32
    }
    %1 = arith.cmpf ogt, %0, %cst_1 : f32
    %2 = arith.xori %1, %true : i1
    %3 = arith.extui %2 : i1 to i32
    return %3 : i32
  }
  func.func private @kernel_atax(%arg0: i32, %arg1: i32, %arg2: memref<?x32xf32>, %arg3: memref<?xf32>, %arg4: memref<?xf32>, %arg5: memref<?xf32>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = arith.index_cast %arg1 : i32 to index
    omp.parallel   {
      omp.wsloop   for  (%arg6) : index = (%c0) to (%0) step (%c1) {
        memref.store %cst, %arg4[%arg6] : memref<?xf32>
        omp.yield
      }
      %1 = arith.index_cast %arg0 : i32 to index
      omp.wsloop   for  (%arg6) : index = (%c0) to (%1) step (%c1) {
        memref.store %cst, %arg5[%arg6] : memref<?xf32>
        affine.for %arg7 = 0 to %0 {
          %2 = memref.load %arg2[%arg6, %arg7] : memref<?x32xf32>
          %3 = affine.load %arg3[%arg7] : memref<?xf32>
          %4 = arith.mulf %2, %3 : f32
          %5 = memref.load %arg5[%arg6] : memref<?xf32>
          %6 = arith.addf %5, %4 : f32
          memref.store %6, %arg5[%arg6] : memref<?xf32>
        }
        affine.for %arg7 = 0 to %0 {
          %2 = memref.load %arg2[%arg6, %arg7] : memref<?x32xf32>
          %3 = memref.load %arg5[%arg6] : memref<?xf32>
          %4 = arith.mulf %2, %3 : f32
          %5 = affine.load %arg4[%arg7] : memref<?xf32>
          %6 = arith.addf %5, %4 : f32
          affine.store %6, %arg4[%arg7] : memref<?xf32>
        }
        omp.yield
      }
      omp.terminator
    }
    return
  }
}
