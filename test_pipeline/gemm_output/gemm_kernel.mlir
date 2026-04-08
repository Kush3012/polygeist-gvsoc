module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  func.func @init_array(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: memref<?xf32>, %arg4: memref<?xf32>, %arg5: memref<?x32xf32>, %arg6: memref<?x32xf32>, %arg7: memref<?x32xf32>) attributes {llvm.linkage = #llvm.linkage<external>} {
    %cst = arith.constant 2.123000e+03 : f32
    %cst_0 = arith.constant 3.241200e+04 : f32
    affine.store %cst_0, %arg3[0] : memref<?xf32>
    affine.store %cst, %arg4[0] : memref<?xf32>
    %0 = arith.index_cast %arg0 : i32 to index
    %1 = arith.index_cast %arg1 : i32 to index
    %2 = arith.sitofp %arg0 : i32 to f32
    affine.for %arg8 = 0 to %0 {
      %4 = arith.index_cast %arg8 : index to i32
      %5 = arith.sitofp %4 : i32 to f32
      affine.for %arg9 = 0 to %1 {
        %6 = arith.index_cast %arg9 : index to i32
        %7 = arith.sitofp %6 : i32 to f32
        %8 = arith.mulf %5, %7 : f32
        %9 = arith.divf %8, %2 : f32
        affine.store %9, %arg5[%arg8, %arg9] : memref<?x32xf32>
      }
    }
    %3 = arith.index_cast %arg2 : i32 to index
    affine.for %arg8 = 0 to %0 {
      %4 = arith.index_cast %arg8 : index to i32
      %5 = arith.sitofp %4 : i32 to f32
      affine.for %arg9 = 0 to %3 {
        %6 = arith.index_cast %arg9 : index to i32
        %7 = arith.sitofp %6 : i32 to f32
        %8 = arith.mulf %5, %7 : f32
        %9 = arith.divf %8, %2 : f32
        affine.store %9, %arg6[%arg8, %arg9] : memref<?x32xf32>
      }
    }
    affine.for %arg8 = 0 to %3 {
      %4 = arith.index_cast %arg8 : index to i32
      %5 = arith.sitofp %4 : i32 to f32
      affine.for %arg9 = 0 to %1 {
        %6 = arith.index_cast %arg9 : index to i32
        %7 = arith.sitofp %6 : i32 to f32
        %8 = arith.mulf %5, %7 : f32
        %9 = arith.divf %8, %2 : f32
        affine.store %9, %arg7[%arg8, %arg9] : memref<?x32xf32>
      }
    }
    return
  }
  func.func @kernel_gemm(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: f32, %arg4: f32, %arg5: memref<?x32xf32>, %arg6: memref<?x32xf32>, %arg7: memref<?x32xf32>) attributes {llvm.linkage = #llvm.linkage<external>} {
    %0 = arith.index_cast %arg0 : i32 to index
    %1 = arith.index_cast %arg1 : i32 to index
    %2 = arith.index_cast %arg2 : i32 to index
    affine.for %arg8 = 0 to %0 {
      affine.for %arg9 = 0 to %1 {
        %3 = affine.load %arg5[%arg8, %arg9] : memref<?x32xf32>
        %4 = arith.mulf %3, %arg4 : f32
        affine.store %4, %arg5[%arg8, %arg9] : memref<?x32xf32>
      }
      affine.for %arg9 = 0 to %2 {
        affine.for %arg10 = 0 to %1 {
          %3 = affine.load %arg6[%arg8, %arg9] : memref<?x32xf32>
          %4 = arith.mulf %arg3, %3 : f32
          %5 = affine.load %arg7[%arg9, %arg10] : memref<?x32xf32>
          %6 = arith.mulf %4, %5 : f32
          %7 = affine.load %arg5[%arg8, %arg10] : memref<?x32xf32>
          %8 = arith.addf %7, %6 : f32
          affine.store %8, %arg5[%arg8, %arg10] : memref<?x32xf32>
        }
      }
    }
    return
  }
  func.func @main() -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %cst = arith.constant 3.200000e+01 : f32
    %cst_0 = arith.constant 3.241200e+04 : f32
    %cst_1 = arith.constant 2.123000e+03 : f32
    %cst_2 = arith.constant 0.000000e+00 : f32
    %alloca = memref.alloca() : memref<32x32xf32>
    affine.for %arg0 = 0 to 32 {
      %2 = arith.index_cast %arg0 : index to i32
      %3 = arith.sitofp %2 : i32 to f32
      affine.for %arg1 = 0 to 32 {
        %4 = arith.index_cast %arg1 : index to i32
        %5 = arith.sitofp %4 : i32 to f32
        %6 = arith.mulf %3, %5 : f32
        %7 = arith.divf %6, %cst : f32
        affine.store %7, %alloca[%arg0, %arg1] : memref<32x32xf32>
      }
    }
    affine.for %arg0 = 0 to 32 {
      affine.for %arg1 = 0 to 32 {
        %4 = affine.load %alloca[%arg0, %arg1] : memref<32x32xf32>
        %5 = arith.mulf %4, %cst_1 : f32
        affine.store %5, %alloca[%arg0, %arg1] : memref<32x32xf32>
      }
      %2 = arith.index_cast %arg0 : index to i32
      %3 = arith.sitofp %2 : i32 to f32
      affine.for %arg1 = 0 to 32 {
        %4 = arith.index_cast %arg1 : index to i32
        %5 = arith.sitofp %4 : i32 to f32
        %6 = arith.mulf %3, %5 : f32
        %7 = arith.divf %6, %cst : f32
        %8 = arith.mulf %7, %cst_0 : f32
        affine.for %arg2 = 0 to 32 {
          %9 = arith.index_cast %arg2 : index to i32
          %10 = arith.sitofp %9 : i32 to f32
          %11 = arith.mulf %5, %10 : f32
          %12 = arith.divf %11, %cst : f32
          %13 = arith.mulf %8, %12 : f32
          %14 = affine.load %alloca[%arg0, %arg2] : memref<32x32xf32>
          %15 = arith.addf %14, %13 : f32
          affine.store %15, %alloca[%arg0, %arg2] : memref<32x32xf32>
        }
      }
    }
    %0 = affine.for %arg0 = 0 to 32 iter_args(%arg1 = %cst_2) -> (f32) {
      %2 = affine.for %arg2 = 0 to 32 iter_args(%arg3 = %arg1) -> (f32) {
        %3 = affine.load %alloca[%arg0, %arg2] : memref<32x32xf32>
        %4 = arith.addf %arg3, %3 : f32
        affine.yield %4 : f32
      }
      affine.yield %2 : f32
    }
    %1 = arith.fptosi %0 : f32 to i32
    return %1 : i32
  }
}
