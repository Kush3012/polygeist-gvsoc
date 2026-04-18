module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i16, dense<[16, 32]> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<i8, dense<[8, 32]> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i128, dense<128> : vector<2xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>>, llvm.data_layout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128", llvm.target_triple = "aarch64-unknown-linux-gnu", "polygeist.target-cpu" = "generic", "polygeist.target-features" = "+fp-armv8,+neon,+outline-atomics,+v8a,-fmv"} {
  llvm.func @main() -> i32 {
    %0 = llvm.mlir.constant(true) : i1
    %1 = llvm.mlir.constant(3.200000e+01 : f32) : f32
    %2 = llvm.mlir.constant(1.500000e+00 : f32) : f32
    %3 = llvm.mlir.constant(1.200000e+00 : f32) : f32
    %4 = llvm.mlir.constant(1 : i32) : i32
    %5 = llvm.mlir.constant(2 : i32) : i32
    %6 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %7 = llvm.mlir.constant(32 : i32) : i32
    %8 = llvm.mlir.constant(32 : index) : i64
    %9 = llvm.mlir.constant(32 : index) : i64
    %10 = llvm.mlir.constant(1 : index) : i64
    %11 = llvm.mlir.constant(1024 : index) : i64
    %12 = llvm.alloca %11 x f32 : (i64) -> !llvm.ptr
    %13 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %14 = llvm.insertvalue %12, %13[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %12, %14[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.insertvalue %16, %15[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.insertvalue %8, %17[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.insertvalue %9, %18[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.insertvalue %9, %19[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.insertvalue %10, %20[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.mlir.constant(32 : index) : i64
    %23 = llvm.mlir.constant(32 : index) : i64
    %24 = llvm.mlir.constant(1 : index) : i64
    %25 = llvm.mlir.constant(1024 : index) : i64
    %26 = llvm.alloca %25 x f32 : (i64) -> !llvm.ptr
    %27 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %28 = llvm.insertvalue %26, %27[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.insertvalue %26, %28[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.mlir.constant(0 : index) : i64
    %31 = llvm.insertvalue %30, %29[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.insertvalue %22, %31[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.insertvalue %23, %32[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %23, %33[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %24, %34[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.mlir.constant(32 : index) : i64
    %37 = llvm.mlir.constant(32 : index) : i64
    %38 = llvm.mlir.constant(1 : index) : i64
    %39 = llvm.mlir.constant(1024 : index) : i64
    %40 = llvm.alloca %39 x f32 : (i64) -> !llvm.ptr
    %41 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %42 = llvm.insertvalue %40, %41[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %43 = llvm.insertvalue %40, %42[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %44 = llvm.mlir.constant(0 : index) : i64
    %45 = llvm.insertvalue %44, %43[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %46 = llvm.insertvalue %36, %45[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.insertvalue %37, %46[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.insertvalue %37, %47[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.insertvalue %38, %48[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.mlir.constant(0 : index) : i64
    %51 = llvm.mlir.constant(32 : index) : i64
    %52 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%50 : i64)
  ^bb1(%53: i64):  // 2 preds: ^bb0, ^bb5
    %54 = llvm.icmp "slt" %53, %51 : i64
    llvm.cond_br %54, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    %55 = llvm.trunc %53 : i64 to i32
    %56 = llvm.mlir.constant(0 : index) : i64
    %57 = llvm.mlir.constant(32 : index) : i64
    %58 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb3(%56 : i64)
  ^bb3(%59: i64):  // 2 preds: ^bb2, ^bb4
    %60 = llvm.icmp "slt" %59, %57 : i64
    llvm.cond_br %60, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %61 = llvm.trunc %59 : i64 to i32
    %62 = llvm.mul %55, %61  : i32
    %63 = llvm.srem %62, %7  : i32
    %64 = llvm.sitofp %63 : i32 to f32
    %65 = llvm.fdiv %64, %1  : f32
    %66 = llvm.mlir.constant(32 : index) : i64
    %67 = llvm.mul %53, %66  : i64
    %68 = llvm.add %67, %59  : i64
    %69 = llvm.getelementptr %40[%68] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %65, %69 : f32, !llvm.ptr
    %70 = llvm.add %59, %58  : i64
    llvm.br ^bb3(%70 : i64)
  ^bb5:  // pred: ^bb3
    %71 = llvm.add %53, %52  : i64
    llvm.br ^bb1(%71 : i64)
  ^bb6:  // pred: ^bb1
    %72 = llvm.mlir.constant(0 : index) : i64
    %73 = llvm.mlir.constant(32 : index) : i64
    %74 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb7(%72 : i64)
  ^bb7(%75: i64):  // 2 preds: ^bb6, ^bb11
    %76 = llvm.icmp "slt" %75, %73 : i64
    llvm.cond_br %76, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    %77 = llvm.trunc %75 : i64 to i32
    %78 = llvm.mlir.constant(0 : index) : i64
    %79 = llvm.mlir.constant(32 : index) : i64
    %80 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb9(%78 : i64)
  ^bb9(%81: i64):  // 2 preds: ^bb8, ^bb10
    %82 = llvm.icmp "slt" %81, %79 : i64
    llvm.cond_br %82, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %83 = llvm.trunc %81 : i64 to i32
    %84 = llvm.add %83, %4  : i32
    %85 = llvm.mul %77, %84  : i32
    %86 = llvm.srem %85, %7  : i32
    %87 = llvm.sitofp %86 : i32 to f32
    %88 = llvm.fdiv %87, %1  : f32
    %89 = llvm.mlir.constant(32 : index) : i64
    %90 = llvm.mul %75, %89  : i64
    %91 = llvm.add %90, %81  : i64
    %92 = llvm.getelementptr %26[%91] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %88, %92 : f32, !llvm.ptr
    %93 = llvm.add %81, %80  : i64
    llvm.br ^bb9(%93 : i64)
  ^bb11:  // pred: ^bb9
    %94 = llvm.add %75, %74  : i64
    llvm.br ^bb7(%94 : i64)
  ^bb12:  // pred: ^bb7
    %95 = llvm.mlir.constant(0 : index) : i64
    %96 = llvm.mlir.constant(32 : index) : i64
    %97 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb13(%95 : i64)
  ^bb13(%98: i64):  // 2 preds: ^bb12, ^bb17
    %99 = llvm.icmp "slt" %98, %96 : i64
    llvm.cond_br %99, ^bb14, ^bb18
  ^bb14:  // pred: ^bb13
    %100 = llvm.trunc %98 : i64 to i32
    %101 = llvm.mlir.constant(0 : index) : i64
    %102 = llvm.mlir.constant(32 : index) : i64
    %103 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb15(%101 : i64)
  ^bb15(%104: i64):  // 2 preds: ^bb14, ^bb16
    %105 = llvm.icmp "slt" %104, %102 : i64
    llvm.cond_br %105, ^bb16, ^bb17
  ^bb16:  // pred: ^bb15
    %106 = llvm.trunc %104 : i64 to i32
    %107 = llvm.add %106, %5  : i32
    %108 = llvm.mul %100, %107  : i32
    %109 = llvm.srem %108, %7  : i32
    %110 = llvm.sitofp %109 : i32 to f32
    %111 = llvm.fdiv %110, %1  : f32
    %112 = llvm.mlir.constant(32 : index) : i64
    %113 = llvm.mul %98, %112  : i64
    %114 = llvm.add %113, %104  : i64
    %115 = llvm.getelementptr %12[%114] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %111, %115 : f32, !llvm.ptr
    %116 = llvm.add %104, %103  : i64
    llvm.br ^bb15(%116 : i64)
  ^bb17:  // pred: ^bb15
    %117 = llvm.add %98, %97  : i64
    llvm.br ^bb13(%117 : i64)
  ^bb18:  // pred: ^bb13
    llvm.call @kernel_gemm(%7, %7, %7, %2, %3, %40, %40, %44, %36, %37, %37, %38, %26, %26, %30, %22, %23, %23, %24, %12, %12, %16, %8, %9, %9, %10) : (i32, i32, i32, f32, f32, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    %118 = llvm.mlir.constant(0 : index) : i64
    %119 = llvm.mlir.constant(32 : index) : i64
    %120 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb19(%118, %6 : i64, f32)
  ^bb19(%121: i64, %122: f32):  // 2 preds: ^bb18, ^bb23
    %123 = llvm.icmp "slt" %121, %119 : i64
    llvm.cond_br %123, ^bb20, ^bb24
  ^bb20:  // pred: ^bb19
    %124 = llvm.mlir.constant(0 : index) : i64
    %125 = llvm.mlir.constant(32 : index) : i64
    %126 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb21(%124, %122 : i64, f32)
  ^bb21(%127: i64, %128: f32):  // 2 preds: ^bb20, ^bb22
    %129 = llvm.icmp "slt" %127, %125 : i64
    llvm.cond_br %129, ^bb22, ^bb23
  ^bb22:  // pred: ^bb21
    %130 = llvm.mlir.constant(32 : index) : i64
    %131 = llvm.mul %121, %130  : i64
    %132 = llvm.add %131, %127  : i64
    %133 = llvm.getelementptr %40[%132] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %134 = llvm.load %133 : !llvm.ptr -> f32
    %135 = llvm.fadd %128, %134  : f32
    %136 = llvm.add %127, %126  : i64
    llvm.br ^bb21(%136, %135 : i64, f32)
  ^bb23:  // pred: ^bb21
    %137 = llvm.add %121, %120  : i64
    llvm.br ^bb19(%137, %128 : i64, f32)
  ^bb24:  // pred: ^bb19
    %138 = llvm.fcmp "ogt" %122, %6 : f32
    %139 = llvm.xor %138, %0  : i1
    %140 = llvm.zext %139 : i1 to i32
    llvm.return %140 : i32
  }
  llvm.func internal @kernel_gemm(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: f32, %arg4: f32, %arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: !llvm.ptr, %arg13: !llvm.ptr, %arg14: i64, %arg15: i64, %arg16: i64, %arg17: i64, %arg18: i64, %arg19: !llvm.ptr, %arg20: !llvm.ptr, %arg21: i64, %arg22: i64, %arg23: i64, %arg24: i64, %arg25: i64) attributes {sym_visibility = "private"} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg5, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg6, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg7, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg8, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg10, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg9, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg11, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %9 = llvm.insertvalue %arg12, %8[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.insertvalue %arg13, %9[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %arg14, %10[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %arg15, %11[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %arg17, %12[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %arg16, %13[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg18, %14[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %17 = llvm.insertvalue %arg19, %16[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.insertvalue %arg20, %17[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.insertvalue %arg21, %18[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.insertvalue %arg22, %19[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.insertvalue %arg24, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.insertvalue %arg23, %21[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.insertvalue %arg25, %22[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.mlir.constant(0 : index) : i64
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.sext %arg1 : i32 to i64
    %27 = llvm.sext %arg2 : i32 to i64
    omp.parallel   {
      %28 = llvm.sext %arg0 : i32 to i64
      omp.wsloop   for  (%arg26) : i64 = (%24) to (%28) step (%25) {
        %29 = llvm.mlir.constant(0 : index) : i64
        %30 = llvm.mlir.constant(1 : index) : i64
        llvm.br ^bb1(%29 : i64)
      ^bb1(%31: i64):  // 2 preds: ^bb0, ^bb2
        %32 = llvm.icmp "slt" %31, %26 : i64
        llvm.cond_br %32, ^bb2, ^bb3
      ^bb2:  // pred: ^bb1
        %33 = llvm.mlir.constant(32 : index) : i64
        %34 = llvm.mul %arg26, %33  : i64
        %35 = llvm.add %34, %31  : i64
        %36 = llvm.getelementptr %arg6[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %37 = llvm.load %36 : !llvm.ptr -> f32
        %38 = llvm.fmul %37, %arg4  : f32
        %39 = llvm.mlir.constant(32 : index) : i64
        %40 = llvm.mul %arg26, %39  : i64
        %41 = llvm.add %40, %31  : i64
        %42 = llvm.getelementptr %arg6[%41] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %38, %42 : f32, !llvm.ptr
        %43 = llvm.add %31, %30  : i64
        llvm.br ^bb1(%43 : i64)
      ^bb3:  // pred: ^bb1
        %44 = llvm.mlir.constant(0 : index) : i64
        %45 = llvm.mlir.constant(1 : index) : i64
        llvm.br ^bb4(%44 : i64)
      ^bb4(%46: i64):  // 2 preds: ^bb3, ^bb8
        %47 = llvm.icmp "slt" %46, %27 : i64
        llvm.cond_br %47, ^bb5, ^bb9
      ^bb5:  // pred: ^bb4
        %48 = llvm.mlir.constant(0 : index) : i64
        %49 = llvm.mlir.constant(1 : index) : i64
        llvm.br ^bb6(%48 : i64)
      ^bb6(%50: i64):  // 2 preds: ^bb5, ^bb7
        %51 = llvm.icmp "slt" %50, %26 : i64
        llvm.cond_br %51, ^bb7, ^bb8
      ^bb7:  // pred: ^bb6
        %52 = llvm.mlir.constant(32 : index) : i64
        %53 = llvm.mul %arg26, %52  : i64
        %54 = llvm.add %53, %46  : i64
        %55 = llvm.getelementptr %arg13[%54] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %56 = llvm.load %55 : !llvm.ptr -> f32
        %57 = llvm.fmul %arg3, %56  : f32
        %58 = llvm.mlir.constant(32 : index) : i64
        %59 = llvm.mul %46, %58  : i64
        %60 = llvm.add %59, %50  : i64
        %61 = llvm.getelementptr %arg20[%60] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %62 = llvm.load %61 : !llvm.ptr -> f32
        %63 = llvm.fmul %57, %62  : f32
        %64 = llvm.mlir.constant(32 : index) : i64
        %65 = llvm.mul %arg26, %64  : i64
        %66 = llvm.add %65, %50  : i64
        %67 = llvm.getelementptr %arg6[%66] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %68 = llvm.load %67 : !llvm.ptr -> f32
        %69 = llvm.fadd %68, %63  : f32
        %70 = llvm.mlir.constant(32 : index) : i64
        %71 = llvm.mul %arg26, %70  : i64
        %72 = llvm.add %71, %50  : i64
        %73 = llvm.getelementptr %arg6[%72] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %69, %73 : f32, !llvm.ptr
        %74 = llvm.add %50, %49  : i64
        llvm.br ^bb6(%74 : i64)
      ^bb8:  // pred: ^bb6
        %75 = llvm.add %46, %45  : i64
        llvm.br ^bb4(%75 : i64)
      ^bb9:  // pred: ^bb4
        omp.yield
      }
      omp.terminator
    }
    llvm.return
  }
}

