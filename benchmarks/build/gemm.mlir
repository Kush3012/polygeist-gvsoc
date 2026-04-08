module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  func.func @main() -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %true = arith.constant true
    %cst = arith.constant 3.200000e+01 : f32
    %cst_0 = arith.constant 1.500000e+00 : f32
    %cst_1 = arith.constant 1.200000e+00 : f32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %cst_2 = arith.constant 0.000000e+00 : f32
    %c32_i32 = arith.constant 32 : i32
    %alloca = memref.alloca() : memref<32x32xf32>
    %alloca_3 = memref.alloca() : memref<32x32xf32>
    %alloca_4 = memref.alloca() : memref<32x32xf32>
    %cast = memref.cast %alloca_4 : memref<32x32xf32> to memref<?x32xf32>
    %cast_5 = memref.cast %alloca_3 : memref<32x32xf32> to memref<?x32xf32>
    %cast_6 = memref.cast %alloca : memref<32x32xf32> to memref<?x32xf32>
    affine.for %arg0 = 0 to 32 {
      %4 = arith.index_cast %arg0 : index to i32
      affine.for %arg1 = 0 to 32 {
        %5 = arith.index_cast %arg1 : index to i32
        %6 = arith.muli %4, %5 : i32
        %7 = arith.remsi %6, %c32_i32 : i32
        %8 = arith.sitofp %7 : i32 to f32
        %9 = arith.divf %8, %cst : f32
        affine.store %9, %alloca_4[%arg0, %arg1] : memref<32x32xf32>
      }
    }
    affine.for %arg0 = 0 to 32 {
      %4 = arith.index_cast %arg0 : index to i32
      affine.for %arg1 = 0 to 32 {
        %5 = arith.index_cast %arg1 : index to i32
        %6 = arith.addi %5, %c1_i32 : i32
        %7 = arith.muli %4, %6 : i32
        %8 = arith.remsi %7, %c32_i32 : i32
        %9 = arith.sitofp %8 : i32 to f32
        %10 = arith.divf %9, %cst : f32
        affine.store %10, %alloca_3[%arg0, %arg1] : memref<32x32xf32>
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
        affine.store %10, %alloca[%arg0, %arg1] : memref<32x32xf32>
      }
    }
    call @kernel_gemm(%c32_i32, %c32_i32, %c32_i32, %cst_0, %cst_1, %cast, %cast_5, %cast_6) : (i32, i32, i32, f32, f32, memref<?x32xf32>, memref<?x32xf32>, memref<?x32xf32>) -> ()
    %0 = affine.for %arg0 = 0 to 32 iter_args(%arg1 = %cst_2) -> (f32) {
      %4 = affine.for %arg2 = 0 to 32 iter_args(%arg3 = %arg1) -> (f32) {
        %5 = affine.load %alloca_4[%arg0, %arg2] : memref<32x32xf32>
        %6 = arith.addf %arg3, %5 : f32
        affine.yield %6 : f32
      }
      affine.yield %4 : f32
    }
    %1 = arith.cmpf ogt, %0, %cst_2 : f32
    %2 = arith.xori %1, %true : i1
    %3 = arith.extui %2 : i1 to i32
    return %3 : i32
  }
  func.func private @kernel_gemm(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: f32, %arg4: f32, %arg5: memref<?x32xf32>, %arg6: memref<?x32xf32>, %arg7: memref<?x32xf32>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = arith.index_cast %arg1 : i32 to index
    %1 = arith.index_cast %arg2 : i32 to index
    omp.parallel   {
      %2 = arith.index_cast %arg0 : i32 to index
      omp.wsloop   for  (%arg8) : index = (%c0) to (%2) step (%c1) {
        affine.for %arg9 = 0 to %0 {
          %3 = memref.load %arg5[%arg8, %arg9] : memref<?x32xf32>
          %4 = arith.mulf %3, %arg4 : f32
          memref.store %4, %arg5[%arg8, %arg9] : memref<?x32xf32>
        }
        affine.for %arg9 = 0 to %1 {
          affine.for %arg10 = 0 to %0 {
            %3 = memref.load %arg6[%arg8, %arg9] : memref<?x32xf32>
            %4 = arith.mulf %arg3, %3 : f32
            %5 = affine.load %arg7[%arg9, %arg10] : memref<?x32xf32>
            %6 = arith.mulf %4, %5 : f32
            %7 = memref.load %arg5[%arg8, %arg10] : memref<?x32xf32>
            %8 = arith.addf %7, %6 : f32
            memref.store %8, %arg5[%arg8, %arg10] : memref<?x32xf32>
          }
        }
        omp.yield
      }
      omp.terminator
    }
    return
  }
}
