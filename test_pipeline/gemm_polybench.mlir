module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>, #dlti.dl_entry<"dlti.endianness", "little">>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  llvm.mlir.global internal constant @str2("\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str1("%0.2f \00") {addr_space = 0 : i32}
  llvm.mlir.global external @stderr() {addr_space = 0 : i32} : memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, array<3 x i8>, array<1 x i8>, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, array<8 x i8>)>>
  llvm.func @fprintf(!llvm.ptr, !llvm.ptr, ...) -> i32
  llvm.mlir.global internal constant @str0("\00") {addr_space = 0 : i32}
  func.func @main(%arg0: i32, %arg1: memref<?xmemref<?xi8>>) -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %cst = arith.constant 3.200000e+01 : f32
    %cst_0 = arith.constant 3.241200e+04 : f32
    %cst_1 = arith.constant 2.123000e+03 : f32
    %c0_i32 = arith.constant 0 : i32
    %c42_i32 = arith.constant 42 : i32
    %c32_i32 = arith.constant 32 : i32
    %alloca = memref.alloca() : memref<32x32xf32>
    %cast = memref.cast %alloca : memref<32x32xf32> to memref<?x32xf32>
    affine.for %arg2 = 0 to 32 {
      %1 = arith.index_cast %arg2 : index to i32
      %2 = arith.sitofp %1 : i32 to f32
      affine.for %arg3 = 0 to 32 {
        %3 = arith.index_cast %arg3 : index to i32
        %4 = arith.sitofp %3 : i32 to f32
        %5 = arith.mulf %2, %4 : f32
        %6 = arith.divf %5, %cst : f32
        affine.store %6, %alloca[%arg2, %arg3] : memref<32x32xf32>
      }
    }
    affine.for %arg2 = 0 to 32 {
      %1 = arith.index_cast %arg2 : index to i32
      %2 = arith.sitofp %1 : i32 to f32
      affine.for %arg3 = 0 to 32 {
        %3 = affine.load %alloca[%arg2, %arg3] : memref<32x32xf32>
        %4 = arith.mulf %3, %cst_1 : f32
        affine.store %4, %alloca[%arg2, %arg3] : memref<32x32xf32>
        %5 = arith.index_cast %arg3 : index to i32
        %6 = arith.sitofp %5 : i32 to f32
        affine.for %arg4 = 0 to 32 {
          %7 = arith.index_cast %arg4 : index to i32
          %8 = arith.sitofp %7 : i32 to f32
          %9 = arith.mulf %2, %8 : f32
          %10 = arith.divf %9, %cst : f32
          %11 = arith.mulf %10, %cst_0 : f32
          %12 = arith.mulf %8, %6 : f32
          %13 = arith.divf %12, %cst : f32
          %14 = arith.mulf %11, %13 : f32
          %15 = affine.load %alloca[%arg2, %arg3] : memref<32x32xf32>
          %16 = arith.addf %15, %14 : f32
          affine.store %16, %alloca[%arg2, %arg3] : memref<32x32xf32>
        }
      }
    }
    %0 = arith.cmpi sgt, %arg0, %c42_i32 : i32
    scf.if %0 {
      %1 = affine.load %arg1[0] : memref<?xmemref<?xi8>>
      %2 = llvm.mlir.addressof @str0 : !llvm.ptr
      %3 = "polygeist.pointer2memref"(%2) : (!llvm.ptr) -> memref<?xi8>
      %4 = func.call @strcmp(%1, %3) : (memref<?xi8>, memref<?xi8>) -> i32
      %5 = arith.cmpi eq, %4, %c0_i32 : i32
      scf.if %5 {
        func.call @print_array(%c32_i32, %c32_i32, %cast) : (i32, i32, memref<?x32xf32>) -> ()
      }
    }
    return %c0_i32 : i32
  }
  func.func private @strcmp(memref<?xi8>, memref<?xi8>) -> i32 attributes {llvm.linkage = #llvm.linkage<external>}
  func.func private @print_array(%arg0: i32, %arg1: i32, %arg2: memref<?x32xf32>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %c20 = arith.constant 20 : index
    %c0 = arith.constant 0 : index
    %0 = arith.index_cast %arg0 : i32 to index
    %1 = arith.index_cast %arg1 : i32 to index
    %2 = llvm.mlir.addressof @stderr : !llvm.ptr
    %3 = llvm.mlir.addressof @str1 : !llvm.ptr
    %4 = llvm.getelementptr %3[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<7 x i8>
    %5 = llvm.mlir.addressof @str2 : !llvm.ptr
    %6 = llvm.getelementptr %5[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<2 x i8>
    affine.for %arg3 = 0 to %0 {
      %10 = arith.muli %arg3, %0 : index
      affine.for %arg4 = 0 to %1 {
        %11 = llvm.load %2 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, array<3 x i8>, array<1 x i8>, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, array<8 x i8>)>>
        %12 = "polygeist.memref2pointer"(%11) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, array<3 x i8>, array<1 x i8>, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, array<8 x i8>)>>) -> !llvm.ptr
        %13 = affine.load %arg2[%arg3, %arg4] : memref<?x32xf32>
        %14 = arith.extf %13 : f32 to f64
        %15 = llvm.call @fprintf(%12, %4, %14) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, f64) -> i32
        %16 = arith.addi %arg4, %10 : index
        %17 = arith.remsi %16, %c20 : index
        %18 = arith.cmpi slt, %17, %c0 : index
        %19 = arith.addi %17, %c20 : index
        %20 = arith.select %18, %19, %17 : index
        %21 = arith.cmpi eq, %20, %c0 : index
        scf.if %21 {
          %22 = llvm.load %2 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, array<3 x i8>, array<1 x i8>, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, array<8 x i8>)>>
          %23 = "polygeist.memref2pointer"(%22) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, array<3 x i8>, array<1 x i8>, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, array<8 x i8>)>>) -> !llvm.ptr
          %24 = llvm.call @fprintf(%23, %6) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr) -> i32
        }
      }
    }
    %7 = llvm.load %2 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, array<3 x i8>, array<1 x i8>, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, array<8 x i8>)>>
    %8 = "polygeist.memref2pointer"(%7) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, array<3 x i8>, array<1 x i8>, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, array<8 x i8>)>>) -> !llvm.ptr
    %9 = llvm.call @fprintf(%8, %6) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr) -> i32
    return
  }
}
