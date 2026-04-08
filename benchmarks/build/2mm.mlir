module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>, #dlti.dl_entry<"dlti.endianness", "little">>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  func.func @main() -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %true = arith.constant true
    %cst = arith.constant 3.200000e+01 : f32
    %cst_0 = arith.constant 1.500000e+00 : f32
    %cst_1 = arith.constant 1.200000e+00 : f32
    %c1_i32 = arith.constant 1 : i32
    %c3_i32 = arith.constant 3 : i32
    %c2_i32 = arith.constant 2 : i32
    %cst_2 = arith.constant 0.000000e+00 : f32
    %c32_i32 = arith.constant 32 : i32
    %alloca = memref.alloca() : memref<32x32xf32>
    %alloca_3 = memref.alloca() : memref<32x32xf32>
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
    affine.parallel (%arg0) = (0) to (32) {
      %4 = arith.index_cast %arg0 : index to i32
      affine.for %arg1 = 0 to 32 {
        affine.store %cst_2, %alloca_3[%arg0, %arg1] : memref<32x32xf32>
        %5 = arith.index_cast %arg1 : index to i32
        %6 = arith.addi %5, %c1_i32 : i32
        affine.for %arg2 = 0 to 32 {
          %7 = arith.index_cast %arg2 : index to i32
          %8 = arith.muli %4, %7 : i32
          %9 = arith.remsi %8, %c32_i32 : i32
          %10 = arith.sitofp %9 : i32 to f32
          %11 = arith.divf %10, %cst : f32
          %12 = arith.mulf %11, %cst_0 : f32
          %13 = arith.addi %7, %c1_i32 : i32
          %14 = arith.muli %13, %6 : i32
          %15 = arith.remsi %14, %c32_i32 : i32
          %16 = arith.sitofp %15 : i32 to f32
          %17 = arith.divf %16, %cst : f32
          %18 = arith.mulf %12, %17 : f32
          %19 = affine.load %alloca_3[%arg0, %arg1] : memref<32x32xf32>
          %20 = arith.addf %19, %18 : f32
          affine.store %20, %alloca_3[%arg0, %arg1] : memref<32x32xf32>
        }
      }
    }
    affine.parallel (%arg0) = (0) to (32) {
      affine.for %arg1 = 0 to 32 {
        %4 = affine.load %alloca[%arg0, %arg1] : memref<32x32xf32>
        %5 = arith.mulf %4, %cst_1 : f32
        affine.store %5, %alloca[%arg0, %arg1] : memref<32x32xf32>
        %6 = arith.index_cast %arg1 : index to i32
        %7 = arith.addi %6, %c3_i32 : i32
        affine.for %arg2 = 0 to 32 {
          %8 = affine.load %alloca_3[%arg0, %arg2] : memref<32x32xf32>
          %9 = arith.index_cast %arg2 : index to i32
          %10 = arith.muli %9, %7 : i32
          %11 = arith.remsi %10, %c32_i32 : i32
          %12 = arith.sitofp %11 : i32 to f32
          %13 = arith.divf %12, %cst : f32
          %14 = arith.mulf %8, %13 : f32
          %15 = affine.load %alloca[%arg0, %arg1] : memref<32x32xf32>
          %16 = arith.addf %15, %14 : f32
          affine.store %16, %alloca[%arg0, %arg1] : memref<32x32xf32>
        }
      }
    }
    %0 = affine.for %arg0 = 0 to 32 iter_args(%arg1 = %cst_2) -> (f32) {
      %4 = affine.for %arg2 = 0 to 32 iter_args(%arg3 = %arg1) -> (f32) {
        %5 = affine.load %alloca[%arg0, %arg2] : memref<32x32xf32>
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
}
