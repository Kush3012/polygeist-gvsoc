module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  llvm.func @init_array(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: !llvm.ptr, %arg9: !llvm.ptr, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: !llvm.ptr, %arg14: !llvm.ptr, %arg15: i64, %arg16: i64, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: !llvm.ptr, %arg21: !llvm.ptr, %arg22: i64, %arg23: i64, %arg24: i64, %arg25: i64, %arg26: i64, %arg27: !llvm.ptr, %arg28: !llvm.ptr, %arg29: i64, %arg30: i64, %arg31: i64, %arg32: i64, %arg33: i64) {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg3, %0[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg4, %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.insertvalue %arg5, %2[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %4 = llvm.insertvalue %arg6, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.insertvalue %arg7, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %6 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %7 = llvm.insertvalue %arg8, %6[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %8 = llvm.insertvalue %arg9, %7[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.insertvalue %arg10, %8[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.insertvalue %arg11, %9[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg12, %10[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %13 = llvm.insertvalue %arg13, %12[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %arg14, %13[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg15, %14[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %arg16, %15[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.insertvalue %arg18, %16[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.insertvalue %arg17, %17[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.insertvalue %arg19, %18[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %21 = llvm.insertvalue %arg20, %20[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.insertvalue %arg21, %21[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.insertvalue %arg22, %22[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.insertvalue %arg23, %23[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.insertvalue %arg25, %24[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.insertvalue %arg24, %25[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.insertvalue %arg26, %26[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %29 = llvm.insertvalue %arg27, %28[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %arg28, %29[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.insertvalue %arg29, %30[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.insertvalue %arg30, %31[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.insertvalue %arg32, %32[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %arg31, %33[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %arg33, %34[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.mlir.constant(2.123000e+03 : f32) : f32
    %37 = llvm.mlir.constant(3.241200e+04 : f32) : f32
    %38 = llvm.mlir.constant(0 : index) : i64
    %39 = llvm.extractvalue %5[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %40 = llvm.getelementptr %39[%38] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %37, %40 : f32, !llvm.ptr
    %41 = llvm.mlir.constant(0 : index) : i64
    %42 = llvm.extractvalue %11[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %43 = llvm.getelementptr %42[%41] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %36, %43 : f32, !llvm.ptr
    %44 = llvm.sext %arg0 : i32 to i64
    %45 = llvm.sext %arg1 : i32 to i64
    %46 = llvm.sitofp %arg0 : i32 to f32
    %47 = llvm.mlir.constant(0 : index) : i64
    %48 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%47 : i64)
  ^bb1(%49: i64):  // 2 preds: ^bb0, ^bb5
    %50 = llvm.icmp "slt" %49, %44 : i64
    llvm.cond_br %50, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    %51 = llvm.trunc %49 : i64 to i32
    %52 = llvm.sitofp %51 : i32 to f32
    %53 = llvm.mlir.constant(0 : index) : i64
    %54 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb3(%53 : i64)
  ^bb3(%55: i64):  // 2 preds: ^bb2, ^bb4
    %56 = llvm.icmp "slt" %55, %45 : i64
    llvm.cond_br %56, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %57 = llvm.trunc %55 : i64 to i32
    %58 = llvm.sitofp %57 : i32 to f32
    %59 = llvm.fmul %52, %58  : f32
    %60 = llvm.fdiv %59, %46  : f32
    %61 = llvm.extractvalue %19[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %62 = llvm.mlir.constant(32 : index) : i64
    %63 = llvm.mul %49, %62  : i64
    %64 = llvm.add %63, %55  : i64
    %65 = llvm.getelementptr %61[%64] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %60, %65 : f32, !llvm.ptr
    %66 = llvm.add %55, %54  : i64
    llvm.br ^bb3(%66 : i64)
  ^bb5:  // pred: ^bb3
    %67 = llvm.add %49, %48  : i64
    llvm.br ^bb1(%67 : i64)
  ^bb6:  // pred: ^bb1
    %68 = llvm.sext %arg2 : i32 to i64
    %69 = llvm.mlir.constant(0 : index) : i64
    %70 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb7(%69 : i64)
  ^bb7(%71: i64):  // 2 preds: ^bb6, ^bb11
    %72 = llvm.icmp "slt" %71, %44 : i64
    llvm.cond_br %72, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    %73 = llvm.trunc %71 : i64 to i32
    %74 = llvm.sitofp %73 : i32 to f32
    %75 = llvm.mlir.constant(0 : index) : i64
    %76 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb9(%75 : i64)
  ^bb9(%77: i64):  // 2 preds: ^bb8, ^bb10
    %78 = llvm.icmp "slt" %77, %68 : i64
    llvm.cond_br %78, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %79 = llvm.trunc %77 : i64 to i32
    %80 = llvm.sitofp %79 : i32 to f32
    %81 = llvm.fmul %74, %80  : f32
    %82 = llvm.fdiv %81, %46  : f32
    %83 = llvm.extractvalue %27[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %84 = llvm.mlir.constant(32 : index) : i64
    %85 = llvm.mul %71, %84  : i64
    %86 = llvm.add %85, %77  : i64
    %87 = llvm.getelementptr %83[%86] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %82, %87 : f32, !llvm.ptr
    %88 = llvm.add %77, %76  : i64
    llvm.br ^bb9(%88 : i64)
  ^bb11:  // pred: ^bb9
    %89 = llvm.add %71, %70  : i64
    llvm.br ^bb7(%89 : i64)
  ^bb12:  // pred: ^bb7
    %90 = llvm.mlir.constant(0 : index) : i64
    %91 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb13(%90 : i64)
  ^bb13(%92: i64):  // 2 preds: ^bb12, ^bb17
    %93 = llvm.icmp "slt" %92, %68 : i64
    llvm.cond_br %93, ^bb14, ^bb18
  ^bb14:  // pred: ^bb13
    %94 = llvm.trunc %92 : i64 to i32
    %95 = llvm.sitofp %94 : i32 to f32
    %96 = llvm.mlir.constant(0 : index) : i64
    %97 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb15(%96 : i64)
  ^bb15(%98: i64):  // 2 preds: ^bb14, ^bb16
    %99 = llvm.icmp "slt" %98, %45 : i64
    llvm.cond_br %99, ^bb16, ^bb17
  ^bb16:  // pred: ^bb15
    %100 = llvm.trunc %98 : i64 to i32
    %101 = llvm.sitofp %100 : i32 to f32
    %102 = llvm.fmul %95, %101  : f32
    %103 = llvm.fdiv %102, %46  : f32
    %104 = llvm.extractvalue %35[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %105 = llvm.mlir.constant(32 : index) : i64
    %106 = llvm.mul %92, %105  : i64
    %107 = llvm.add %106, %98  : i64
    %108 = llvm.getelementptr %104[%107] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %103, %108 : f32, !llvm.ptr
    %109 = llvm.add %98, %97  : i64
    llvm.br ^bb15(%109 : i64)
  ^bb17:  // pred: ^bb15
    %110 = llvm.add %92, %91  : i64
    llvm.br ^bb13(%110 : i64)
  ^bb18:  // pred: ^bb13
    llvm.return
  }
  llvm.func @kernel_gemm(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: f32, %arg4: f32, %arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: !llvm.ptr, %arg13: !llvm.ptr, %arg14: i64, %arg15: i64, %arg16: i64, %arg17: i64, %arg18: i64, %arg19: !llvm.ptr, %arg20: !llvm.ptr, %arg21: i64, %arg22: i64, %arg23: i64, %arg24: i64, %arg25: i64) {
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
    %24 = llvm.sext %arg0 : i32 to i64
    %25 = llvm.sext %arg1 : i32 to i64
    %26 = llvm.sext %arg2 : i32 to i64
    %27 = llvm.mlir.constant(0 : index) : i64
    %28 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%27 : i64)
  ^bb1(%29: i64):  // 2 preds: ^bb0, ^bb11
    %30 = llvm.icmp "slt" %29, %24 : i64
    llvm.cond_br %30, ^bb2, ^bb12
  ^bb2:  // pred: ^bb1
    %31 = llvm.mlir.constant(0 : index) : i64
    %32 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb3(%31 : i64)
  ^bb3(%33: i64):  // 2 preds: ^bb2, ^bb4
    %34 = llvm.icmp "slt" %33, %25 : i64
    llvm.cond_br %34, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %35 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.mlir.constant(32 : index) : i64
    %37 = llvm.mul %29, %36  : i64
    %38 = llvm.add %37, %33  : i64
    %39 = llvm.getelementptr %35[%38] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %40 = llvm.load %39 : !llvm.ptr -> f32
    %41 = llvm.fmul %40, %arg4  : f32
    %42 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %43 = llvm.mlir.constant(32 : index) : i64
    %44 = llvm.mul %29, %43  : i64
    %45 = llvm.add %44, %33  : i64
    %46 = llvm.getelementptr %42[%45] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %41, %46 : f32, !llvm.ptr
    %47 = llvm.add %33, %32  : i64
    llvm.br ^bb3(%47 : i64)
  ^bb5:  // pred: ^bb3
    %48 = llvm.mlir.constant(0 : index) : i64
    %49 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb6(%48 : i64)
  ^bb6(%50: i64):  // 2 preds: ^bb5, ^bb10
    %51 = llvm.icmp "slt" %50, %26 : i64
    llvm.cond_br %51, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    %52 = llvm.mlir.constant(0 : index) : i64
    %53 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb8(%52 : i64)
  ^bb8(%54: i64):  // 2 preds: ^bb7, ^bb9
    %55 = llvm.icmp "slt" %54, %25 : i64
    llvm.cond_br %55, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %56 = llvm.extractvalue %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %57 = llvm.mlir.constant(32 : index) : i64
    %58 = llvm.mul %29, %57  : i64
    %59 = llvm.add %58, %50  : i64
    %60 = llvm.getelementptr %56[%59] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %61 = llvm.load %60 : !llvm.ptr -> f32
    %62 = llvm.fmul %arg3, %61  : f32
    %63 = llvm.extractvalue %23[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %64 = llvm.mlir.constant(32 : index) : i64
    %65 = llvm.mul %50, %64  : i64
    %66 = llvm.add %65, %54  : i64
    %67 = llvm.getelementptr %63[%66] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %68 = llvm.load %67 : !llvm.ptr -> f32
    %69 = llvm.fmul %62, %68  : f32
    %70 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %71 = llvm.mlir.constant(32 : index) : i64
    %72 = llvm.mul %29, %71  : i64
    %73 = llvm.add %72, %54  : i64
    %74 = llvm.getelementptr %70[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %75 = llvm.load %74 : !llvm.ptr -> f32
    %76 = llvm.fadd %75, %69  : f32
    %77 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %78 = llvm.mlir.constant(32 : index) : i64
    %79 = llvm.mul %29, %78  : i64
    %80 = llvm.add %79, %54  : i64
    %81 = llvm.getelementptr %77[%80] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %76, %81 : f32, !llvm.ptr
    %82 = llvm.add %54, %53  : i64
    llvm.br ^bb8(%82 : i64)
  ^bb10:  // pred: ^bb8
    %83 = llvm.add %50, %49  : i64
    llvm.br ^bb6(%83 : i64)
  ^bb11:  // pred: ^bb6
    %84 = llvm.add %29, %28  : i64
    llvm.br ^bb1(%84 : i64)
  ^bb12:  // pred: ^bb1
    llvm.return
  }
  llvm.func @main() -> i32 {
    %0 = llvm.mlir.constant(3.200000e+01 : f32) : f32
    %1 = llvm.mlir.constant(3.241200e+04 : f32) : f32
    %2 = llvm.mlir.constant(2.123000e+03 : f32) : f32
    %3 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %4 = llvm.mlir.constant(32 : index) : i64
    %5 = llvm.mlir.constant(32 : index) : i64
    %6 = llvm.mlir.constant(1 : index) : i64
    %7 = llvm.mlir.constant(1024 : index) : i64
    %8 = llvm.alloca %7 x f32 : (i64) -> !llvm.ptr
    %9 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %10 = llvm.insertvalue %8, %9[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %8, %10[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.insertvalue %12, %11[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %4, %13[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %5, %14[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %5, %15[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.insertvalue %6, %16[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.mlir.constant(0 : index) : i64
    %19 = llvm.mlir.constant(32 : index) : i64
    %20 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%18 : i64)
  ^bb1(%21: i64):  // 2 preds: ^bb0, ^bb5
    %22 = llvm.icmp "slt" %21, %19 : i64
    llvm.cond_br %22, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    %23 = llvm.trunc %21 : i64 to i32
    %24 = llvm.sitofp %23 : i32 to f32
    %25 = llvm.mlir.constant(0 : index) : i64
    %26 = llvm.mlir.constant(32 : index) : i64
    %27 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb3(%25 : i64)
  ^bb3(%28: i64):  // 2 preds: ^bb2, ^bb4
    %29 = llvm.icmp "slt" %28, %26 : i64
    llvm.cond_br %29, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %30 = llvm.trunc %28 : i64 to i32
    %31 = llvm.sitofp %30 : i32 to f32
    %32 = llvm.fmul %24, %31  : f32
    %33 = llvm.fdiv %32, %0  : f32
    %34 = llvm.mlir.constant(32 : index) : i64
    %35 = llvm.mul %21, %34  : i64
    %36 = llvm.add %35, %28  : i64
    %37 = llvm.getelementptr %8[%36] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %33, %37 : f32, !llvm.ptr
    %38 = llvm.add %28, %27  : i64
    llvm.br ^bb3(%38 : i64)
  ^bb5:  // pred: ^bb3
    %39 = llvm.add %21, %20  : i64
    llvm.br ^bb1(%39 : i64)
  ^bb6:  // pred: ^bb1
    %40 = llvm.mlir.constant(0 : index) : i64
    %41 = llvm.mlir.constant(32 : index) : i64
    %42 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb7(%40 : i64)
  ^bb7(%43: i64):  // 2 preds: ^bb6, ^bb17
    %44 = llvm.icmp "slt" %43, %41 : i64
    llvm.cond_br %44, ^bb8, ^bb18
  ^bb8:  // pred: ^bb7
    %45 = llvm.mlir.constant(0 : index) : i64
    %46 = llvm.mlir.constant(32 : index) : i64
    %47 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb9(%45 : i64)
  ^bb9(%48: i64):  // 2 preds: ^bb8, ^bb10
    %49 = llvm.icmp "slt" %48, %46 : i64
    llvm.cond_br %49, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %50 = llvm.mlir.constant(32 : index) : i64
    %51 = llvm.mul %43, %50  : i64
    %52 = llvm.add %51, %48  : i64
    %53 = llvm.getelementptr %8[%52] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %54 = llvm.load %53 : !llvm.ptr -> f32
    %55 = llvm.fmul %54, %2  : f32
    %56 = llvm.mlir.constant(32 : index) : i64
    %57 = llvm.mul %43, %56  : i64
    %58 = llvm.add %57, %48  : i64
    %59 = llvm.getelementptr %8[%58] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %55, %59 : f32, !llvm.ptr
    %60 = llvm.add %48, %47  : i64
    llvm.br ^bb9(%60 : i64)
  ^bb11:  // pred: ^bb9
    %61 = llvm.trunc %43 : i64 to i32
    %62 = llvm.sitofp %61 : i32 to f32
    %63 = llvm.mlir.constant(0 : index) : i64
    %64 = llvm.mlir.constant(32 : index) : i64
    %65 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb12(%63 : i64)
  ^bb12(%66: i64):  // 2 preds: ^bb11, ^bb16
    %67 = llvm.icmp "slt" %66, %64 : i64
    llvm.cond_br %67, ^bb13, ^bb17
  ^bb13:  // pred: ^bb12
    %68 = llvm.trunc %66 : i64 to i32
    %69 = llvm.sitofp %68 : i32 to f32
    %70 = llvm.fmul %62, %69  : f32
    %71 = llvm.fdiv %70, %0  : f32
    %72 = llvm.fmul %71, %1  : f32
    %73 = llvm.mlir.constant(0 : index) : i64
    %74 = llvm.mlir.constant(32 : index) : i64
    %75 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb14(%73 : i64)
  ^bb14(%76: i64):  // 2 preds: ^bb13, ^bb15
    %77 = llvm.icmp "slt" %76, %74 : i64
    llvm.cond_br %77, ^bb15, ^bb16
  ^bb15:  // pred: ^bb14
    %78 = llvm.trunc %76 : i64 to i32
    %79 = llvm.sitofp %78 : i32 to f32
    %80 = llvm.fmul %69, %79  : f32
    %81 = llvm.fdiv %80, %0  : f32
    %82 = llvm.fmul %72, %81  : f32
    %83 = llvm.mlir.constant(32 : index) : i64
    %84 = llvm.mul %43, %83  : i64
    %85 = llvm.add %84, %76  : i64
    %86 = llvm.getelementptr %8[%85] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %87 = llvm.load %86 : !llvm.ptr -> f32
    %88 = llvm.fadd %87, %82  : f32
    %89 = llvm.mlir.constant(32 : index) : i64
    %90 = llvm.mul %43, %89  : i64
    %91 = llvm.add %90, %76  : i64
    %92 = llvm.getelementptr %8[%91] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %88, %92 : f32, !llvm.ptr
    %93 = llvm.add %76, %75  : i64
    llvm.br ^bb14(%93 : i64)
  ^bb16:  // pred: ^bb14
    %94 = llvm.add %66, %65  : i64
    llvm.br ^bb12(%94 : i64)
  ^bb17:  // pred: ^bb12
    %95 = llvm.add %43, %42  : i64
    llvm.br ^bb7(%95 : i64)
  ^bb18:  // pred: ^bb7
    %96 = llvm.mlir.constant(0 : index) : i64
    %97 = llvm.mlir.constant(32 : index) : i64
    %98 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb19(%96, %3 : i64, f32)
  ^bb19(%99: i64, %100: f32):  // 2 preds: ^bb18, ^bb23
    %101 = llvm.icmp "slt" %99, %97 : i64
    llvm.cond_br %101, ^bb20, ^bb24
  ^bb20:  // pred: ^bb19
    %102 = llvm.mlir.constant(0 : index) : i64
    %103 = llvm.mlir.constant(32 : index) : i64
    %104 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb21(%102, %100 : i64, f32)
  ^bb21(%105: i64, %106: f32):  // 2 preds: ^bb20, ^bb22
    %107 = llvm.icmp "slt" %105, %103 : i64
    llvm.cond_br %107, ^bb22, ^bb23
  ^bb22:  // pred: ^bb21
    %108 = llvm.mlir.constant(32 : index) : i64
    %109 = llvm.mul %99, %108  : i64
    %110 = llvm.add %109, %105  : i64
    %111 = llvm.getelementptr %8[%110] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %112 = llvm.load %111 : !llvm.ptr -> f32
    %113 = llvm.fadd %106, %112  : f32
    %114 = llvm.add %105, %104  : i64
    llvm.br ^bb21(%114, %113 : i64, f32)
  ^bb23:  // pred: ^bb21
    %115 = llvm.add %99, %98  : i64
    llvm.br ^bb19(%115, %106 : i64, f32)
  ^bb24:  // pred: ^bb19
    %116 = llvm.fptosi %100 : f32 to i32
    llvm.return %116 : i32
  }
}

