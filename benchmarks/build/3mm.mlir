module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i8, dense<[8, 32]> : vector<2xi32>>, #dlti.dl_entry<i16, dense<[16, 32]> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i128, dense<128> : vector<2xi32>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>>, llvm.data_layout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128", llvm.target_triple = "aarch64-unknown-linux-gnu", "polygeist.target-cpu" = "generic", "polygeist.target-features" = "+fp-armv8,+neon,+outline-atomics,+v8a,-fmv"} {
  func.func @main() -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %cst = arith.constant 1.600000e+02 : f32
    %c1_i32 = arith.constant 1 : i32
    %c3_i32 = arith.constant 3 : i32
    %c2_i32 = arith.constant 2 : i32
    %true = arith.constant true
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c32_i32 = arith.constant 32 : i32
    %alloca = memref.alloca() : memref<32x32xf32>
    %alloca_1 = memref.alloca() : memref<32x32xf32>
    %alloca_2 = memref.alloca() : memref<32x32xf32>
    %alloca_3 = memref.alloca() : memref<32x32xf32>
    %alloca_4 = memref.alloca() : memref<32x32xf32>
    %alloca_5 = memref.alloca() : memref<32x32xf32>
    %alloca_6 = memref.alloca() : memref<32x32xf32>
    %cast = memref.cast %alloca_5 : memref<32x32xf32> to memref<?x32xf32>
    %cast_7 = memref.cast %alloca_4 : memref<32x32xf32> to memref<?x32xf32>
    %cast_8 = memref.cast %alloca_2 : memref<32x32xf32> to memref<?x32xf32>
    %cast_9 = memref.cast %alloca_1 : memref<32x32xf32> to memref<?x32xf32>
    affine.for %arg0 = 0 to 32 {
      %4 = arith.index_cast %arg0 : index to i32
      affine.for %arg1 = 0 to 32 {
        %5 = arith.index_cast %arg1 : index to i32
        %6 = arith.muli %4, %5 : i32
        %7 = arith.remsi %6, %c32_i32 : i32
        %8 = arith.sitofp %7 : i32 to f32
        %9 = arith.divf %8, %cst : f32
        affine.store %9, %alloca_5[%arg0, %arg1] : memref<32x32xf32>
      }
    }
    affine.for %arg0 = 0 to 32 {
      %4 = arith.index_cast %arg0 : index to i32
      %5 = arith.addi %4, %c1_i32 : i32
      affine.for %arg1 = 0 to 32 {
        %6 = arith.index_cast %arg1 : index to i32
        %7 = arith.addi %6, %c1_i32 : i32
        %8 = arith.muli %5, %7 : i32
        %9 = arith.remsi %8, %c32_i32 : i32
        %10 = arith.sitofp %9 : i32 to f32
        %11 = arith.divf %10, %cst : f32
        affine.store %11, %alloca_4[%arg0, %arg1] : memref<32x32xf32>
      }
    }
    affine.for %arg0 = 0 to 32 {
      %4 = arith.index_cast %arg0 : index to i32
      affine.for %arg1 = 0 to 32 {
        %5 = arith.index_cast %arg1 : index to i32
        %6 = arith.addi %5, %c3_i32 : i32
        %7 = arith.muli %4, %6 : i32
        %8 = arith.remsi %7, %c32_i32 : i32
        %9 = arith.sitofp %8 : i32 to f32
        %10 = arith.divf %9, %cst : f32
        affine.store %10, %alloca_2[%arg0, %arg1] : memref<32x32xf32>
      }
    }
    affine.for %arg0 = 0 to 32 {
      %4 = arith.index_cast %arg0 : index to i32
      affine.for %arg1 = 0 to 32 {
        %5 = arith.index_cast %arg1 : index to i32
        %6 = arith.addi %5, %c2_i32 : i32
        %7 = arith.muli %4, %6 : i32
        %8 = arith.remsi %7, %c32_i32 : i32
        %9 = arith.sitofp %8 : i32 to f32
        %10 = arith.divf %9, %cst : f32
        affine.store %10, %alloca_1[%arg0, %arg1] : memref<32x32xf32>
      }
    }
    %cast_10 = memref.cast %alloca_6 : memref<32x32xf32> to memref<?x32xf32>
    %cast_11 = memref.cast %alloca_3 : memref<32x32xf32> to memref<?x32xf32>
    %cast_12 = memref.cast %alloca : memref<32x32xf32> to memref<?x32xf32>
    call @kernel_3mm(%c32_i32, %c32_i32, %c32_i32, %c32_i32, %c32_i32, %cast_10, %cast, %cast_7, %cast_11, %cast_8, %cast_9, %cast_12) : (i32, i32, i32, i32, i32, memref<?x32xf32>, memref<?x32xf32>, memref<?x32xf32>, memref<?x32xf32>, memref<?x32xf32>, memref<?x32xf32>, memref<?x32xf32>) -> ()
    %0 = affine.for %arg0 = 0 to 32 iter_args(%arg1 = %cst_0) -> (f32) {
      %4 = affine.for %arg2 = 0 to 32 iter_args(%arg3 = %arg1) -> (f32) {
        %5 = affine.load %alloca[%arg0, %arg2] : memref<32x32xf32>
        %6 = arith.addf %arg3, %5 : f32
        affine.yield %6 : f32
      }
      affine.yield %4 : f32
    }
    %1 = arith.cmpf ogt, %0, %cst_0 : f32
    %2 = arith.xori %1, %true : i1
    %3 = arith.extui %2 : i1 to i32
    return %3 : i32
  }
  func.func private @kernel_3mm(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: memref<?x32xf32>, %arg6: memref<?x32xf32>, %arg7: memref<?x32xf32>, %arg8: memref<?x32xf32>, %arg9: memref<?x32xf32>, %arg10: memref<?x32xf32>, %arg11: memref<?x32xf32>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = arith.index_cast %arg2 : i32 to index
    %1 = arith.index_cast %arg4 : i32 to index
    %2 = arith.index_cast %arg3 : i32 to index
    %3 = arith.index_cast %arg1 : i32 to index
    omp.parallel   {
      %4 = arith.index_cast %arg0 : i32 to index
      omp.wsloop   for  (%arg12) : index = (%c0) to (%4) step (%c1) {
        affine.for %arg13 = 0 to %3 {
          memref.store %cst, %arg5[%arg12, %arg13] : memref<?x32xf32>
          affine.for %arg14 = 0 to %0 {
            %5 = memref.load %arg6[%arg12, %arg14] : memref<?x32xf32>
            %6 = affine.load %arg7[%arg14, %arg13] : memref<?x32xf32>
            %7 = arith.mulf %5, %6 : f32
            %8 = memref.load %arg5[%arg12, %arg13] : memref<?x32xf32>
            %9 = arith.addf %8, %7 : f32
            memref.store %9, %arg5[%arg12, %arg13] : memref<?x32xf32>
          }
        }
        omp.yield
      }
      omp.terminator
    }
    omp.parallel   {
      omp.wsloop   for  (%arg12) : index = (%c0) to (%3) step (%c1) {
        affine.for %arg13 = 0 to %2 {
          memref.store %cst, %arg8[%arg12, %arg13] : memref<?x32xf32>
          affine.for %arg14 = 0 to %1 {
            %4 = memref.load %arg9[%arg12, %arg14] : memref<?x32xf32>
            %5 = affine.load %arg10[%arg14, %arg13] : memref<?x32xf32>
            %6 = arith.mulf %4, %5 : f32
            %7 = memref.load %arg8[%arg12, %arg13] : memref<?x32xf32>
            %8 = arith.addf %7, %6 : f32
            memref.store %8, %arg8[%arg12, %arg13] : memref<?x32xf32>
          }
        }
        omp.yield
      }
      omp.terminator
    }
    omp.parallel   {
      %4 = arith.index_cast %arg0 : i32 to index
      omp.wsloop   for  (%arg12) : index = (%c0) to (%4) step (%c1) {
        affine.for %arg13 = 0 to %2 {
          memref.store %cst, %arg11[%arg12, %arg13] : memref<?x32xf32>
          affine.for %arg14 = 0 to %3 {
            %5 = memref.load %arg5[%arg12, %arg14] : memref<?x32xf32>
            %6 = affine.load %arg8[%arg14, %arg13] : memref<?x32xf32>
            %7 = arith.mulf %5, %6 : f32
            %8 = memref.load %arg11[%arg12, %arg13] : memref<?x32xf32>
            %9 = arith.addf %8, %7 : f32
            memref.store %9, %arg11[%arg12, %arg13] : memref<?x32xf32>
          }
        }
        omp.yield
      }
      omp.terminator
    }
    return
  }
}
