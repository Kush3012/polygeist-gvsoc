module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  func.func @gemm(%arg0: i32, %arg1: f32, %arg2: f32, %arg3: memref<?x16xf32>, %arg4: memref<?x16xf32>, %arg5: memref<?x16xf32>) attributes {llvm.linkage = #llvm.linkage<external>} {
    %0 = arith.index_cast %arg0 : i32 to index
    affine.for %arg6 = 0 to %0 {
      affine.for %arg7 = 0 to %0 {
        %1 = affine.load %arg3[%arg6, %arg7] : memref<?x16xf32>
        %2 = arith.mulf %1, %arg2 : f32
        affine.store %2, %arg3[%arg6, %arg7] : memref<?x16xf32>
        affine.for %arg8 = 0 to %0 {
          %3 = affine.load %arg4[%arg6, %arg8] : memref<?x16xf32>
          %4 = arith.mulf %arg1, %3 : f32
          %5 = affine.load %arg5[%arg8, %arg7] : memref<?x16xf32>
          %6 = arith.mulf %4, %5 : f32
          %7 = affine.load %arg3[%arg6, %arg7] : memref<?x16xf32>
          %8 = arith.addf %7, %6 : f32
          affine.store %8, %arg3[%arg6, %arg7] : memref<?x16xf32>
        }
      }
    }
    return
  }
  func.func @main() -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %cst = arith.constant 0.000000e+00 : f32
    %alloca = memref.alloca() : memref<16x16xf32>
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 16 {
        affine.store %cst, %alloca[%arg0, %arg1] : memref<16x16xf32>
      }
    }
    affine.for %arg0 = 0 to 16 {
      %2 = arith.index_cast %arg0 : index to i32
      affine.for %arg1 = 0 to 16 {
        %3 = affine.load %alloca[%arg0, %arg1] : memref<16x16xf32>
        %4 = arith.mulf %3, %cst : f32
        affine.store %4, %alloca[%arg0, %arg1] : memref<16x16xf32>
        %5 = arith.index_cast %arg1 : index to i32
        affine.for %arg2 = 0 to 16 {
          %6 = arith.index_cast %arg2 : index to i32
          %7 = arith.addi %2, %6 : i32
          %8 = arith.sitofp %7 : i32 to f32
          %9 = arith.muli %6, %5 : i32
          %10 = arith.sitofp %9 : i32 to f32
          %11 = arith.mulf %8, %10 : f32
          %12 = affine.load %alloca[%arg0, %arg1] : memref<16x16xf32>
          %13 = arith.addf %12, %11 : f32
          affine.store %13, %alloca[%arg0, %arg1] : memref<16x16xf32>
        }
      }
    }
    %0 = affine.load %alloca[0, 0] : memref<16x16xf32>
    %1 = arith.fptosi %0 : f32 to i32
    return %1 : i32
  }
}
