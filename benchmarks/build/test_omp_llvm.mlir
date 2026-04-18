module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i128, dense<128> : vector<2xi32>>, #dlti.dl_entry<i8, dense<[8, 32]> : vector<2xi32>>, #dlti.dl_entry<i16, dense<[16, 32]> : vector<2xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>, #dlti.dl_entry<"dlti.endianness", "little">>, llvm.data_layout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128", llvm.target_triple = "aarch64-unknown-linux-gnu", "polygeist.target-cpu" = "generic", "polygeist.target-features" = "+fp-armv8,+neon,+outline-atomics,+v8a,-fmv"} {
  llvm.mlir.global private @thread_seen() {addr_space = 0 : i32} : !llvm.array<8 x i32> {
    %0 = llvm.mlir.undef : !llvm.array<8 x i32>
    llvm.return %0 : !llvm.array<8 x i32>
  }
  llvm.func @kernel_test() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(8 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.zero : !llvm.ptr
    %4 = llvm.getelementptr %3[8] : (!llvm.ptr) -> !llvm.ptr, i32
    %5 = llvm.ptrtoint %4 : !llvm.ptr to i64
    %6 = llvm.mlir.addressof @thread_seen : !llvm.ptr
    %7 = llvm.getelementptr %6[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<8 x i32>
    %8 = llvm.mlir.constant(3735928559 : index) : i64
    %9 = llvm.inttoptr %8 : i64 to !llvm.ptr
    %10 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %11 = llvm.insertvalue %9, %10[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.insertvalue %7, %11[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %13 = llvm.mlir.constant(0 : index) : i64
    %14 = llvm.insertvalue %13, %12[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %15 = llvm.insertvalue %1, %14[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.insertvalue %2, %15[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %17 = llvm.mlir.constant(0 : index) : i64
    %18 = llvm.mlir.constant(8 : index) : i64
    %19 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%17 : i64)
  ^bb1(%20: i64):  // 2 preds: ^bb0, ^bb2
    %21 = llvm.icmp "slt" %20, %18 : i64
    llvm.cond_br %21, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %22 = llvm.getelementptr %7[%20] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %0, %22 : i32, !llvm.ptr
    %23 = llvm.add %20, %19  : i64
    llvm.br ^bb1(%23 : i64)
  ^bb3:  // pred: ^bb1
    llvm.return
  }
  llvm.func @main() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(8 : i32) : i32
    %2 = llvm.mlir.constant(0 : i32) : i32
    %3 = llvm.mlir.constant(8 : index) : i64
    %4 = llvm.mlir.constant(1 : index) : i64
    %5 = llvm.mlir.zero : !llvm.ptr
    %6 = llvm.getelementptr %5[8] : (!llvm.ptr) -> !llvm.ptr, i32
    %7 = llvm.ptrtoint %6 : !llvm.ptr to i64
    %8 = llvm.mlir.addressof @thread_seen : !llvm.ptr
    %9 = llvm.getelementptr %8[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<8 x i32>
    %10 = llvm.mlir.constant(3735928559 : index) : i64
    %11 = llvm.inttoptr %10 : i64 to !llvm.ptr
    %12 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %13 = llvm.insertvalue %11, %12[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.insertvalue %9, %13[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %15 = llvm.mlir.constant(0 : index) : i64
    %16 = llvm.insertvalue %15, %14[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %17 = llvm.insertvalue %3, %16[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.insertvalue %4, %17[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %19 = llvm.mlir.constant(0 : index) : i64
    %20 = llvm.mlir.constant(8 : index) : i64
    %21 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%19 : i64)
  ^bb1(%22: i64):  // 2 preds: ^bb0, ^bb2
    %23 = llvm.icmp "slt" %22, %20 : i64
    llvm.cond_br %23, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %24 = llvm.getelementptr %9[%22] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %2, %24 : i32, !llvm.ptr
    %25 = llvm.add %22, %21  : i64
    llvm.br ^bb1(%25 : i64)
  ^bb3:  // pred: ^bb1
    %26 = llvm.mlir.constant(0 : index) : i64
    %27 = llvm.mlir.constant(8 : index) : i64
    %28 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb4(%26 : i64)
  ^bb4(%29: i64):  // 2 preds: ^bb3, ^bb5
    %30 = llvm.icmp "slt" %29, %27 : i64
    llvm.cond_br %30, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %31 = llvm.getelementptr %9[%29] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.store %0, %31 : i32, !llvm.ptr
    %32 = llvm.add %29, %28  : i64
    llvm.br ^bb4(%32 : i64)
  ^bb6:  // pred: ^bb4
    %33 = llvm.mlir.constant(0 : index) : i64
    %34 = llvm.mlir.constant(8 : index) : i64
    %35 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb7(%33, %2 : i64, i32)
  ^bb7(%36: i64, %37: i32):  // 2 preds: ^bb6, ^bb8
    %38 = llvm.icmp "slt" %36, %34 : i64
    llvm.cond_br %38, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %39 = llvm.getelementptr %9[%36] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %40 = llvm.load %39 : !llvm.ptr -> i32
    %41 = llvm.add %37, %40  : i32
    %42 = llvm.add %36, %35  : i64
    llvm.br ^bb7(%42, %41 : i64, i32)
  ^bb9:  // pred: ^bb7
    %43 = llvm.icmp "ne" %37, %1 : i32
    %44 = llvm.zext %43 : i1 to i32
    llvm.return %44 : i32
  }
}

