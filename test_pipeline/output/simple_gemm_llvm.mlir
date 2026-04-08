module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  llvm.func @gemm(%arg0: i32, %arg1: f32, %arg2: f32, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: !llvm.ptr, %arg11: !llvm.ptr, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: i64, %arg16: i64, %arg17: !llvm.ptr, %arg18: !llvm.ptr, %arg19: i64, %arg20: i64, %arg21: i64, %arg22: i64, %arg23: i64) {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg3, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg4, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg5, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg6, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg8, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg7, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg9, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %9 = llvm.insertvalue %arg10, %8[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.insertvalue %arg11, %9[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %arg12, %10[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %arg13, %11[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %arg15, %12[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %arg14, %13[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg16, %14[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %17 = llvm.insertvalue %arg17, %16[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.insertvalue %arg18, %17[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.insertvalue %arg19, %18[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.insertvalue %arg20, %19[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.insertvalue %arg22, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.insertvalue %arg21, %21[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.insertvalue %arg23, %22[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.sext %arg0 : i32 to i64
    %25 = llvm.mlir.constant(0 : index) : i64
    %26 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%25 : i64)
  ^bb1(%27: i64):  // 2 preds: ^bb0, ^bb8
    %28 = llvm.icmp "slt" %27, %24 : i64
    llvm.cond_br %28, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    %29 = llvm.mlir.constant(0 : index) : i64
    %30 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb3(%29 : i64)
  ^bb3(%31: i64):  // 2 preds: ^bb2, ^bb7
    %32 = llvm.icmp "slt" %31, %24 : i64
    llvm.cond_br %32, ^bb4, ^bb8
  ^bb4:  // pred: ^bb3
    %33 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.mlir.constant(16 : index) : i64
    %35 = llvm.mul %27, %34  : i64
    %36 = llvm.add %35, %31  : i64
    %37 = llvm.getelementptr %33[%36] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %38 = llvm.load %37 : !llvm.ptr -> f32
    %39 = llvm.fmul %38, %arg2  : f32
    %40 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %41 = llvm.mlir.constant(16 : index) : i64
    %42 = llvm.mul %27, %41  : i64
    %43 = llvm.add %42, %31  : i64
    %44 = llvm.getelementptr %40[%43] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %39, %44 : f32, !llvm.ptr
    %45 = llvm.mlir.constant(0 : index) : i64
    %46 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb5(%45 : i64)
  ^bb5(%47: i64):  // 2 preds: ^bb4, ^bb6
    %48 = llvm.icmp "slt" %47, %24 : i64
    llvm.cond_br %48, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    %49 = llvm.extractvalue %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.mlir.constant(16 : index) : i64
    %51 = llvm.mul %27, %50  : i64
    %52 = llvm.add %51, %47  : i64
    %53 = llvm.getelementptr %49[%52] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %54 = llvm.load %53 : !llvm.ptr -> f32
    %55 = llvm.fmul %arg1, %54  : f32
    %56 = llvm.extractvalue %23[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %57 = llvm.mlir.constant(16 : index) : i64
    %58 = llvm.mul %47, %57  : i64
    %59 = llvm.add %58, %31  : i64
    %60 = llvm.getelementptr %56[%59] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %61 = llvm.load %60 : !llvm.ptr -> f32
    %62 = llvm.fmul %55, %61  : f32
    %63 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %64 = llvm.mlir.constant(16 : index) : i64
    %65 = llvm.mul %27, %64  : i64
    %66 = llvm.add %65, %31  : i64
    %67 = llvm.getelementptr %63[%66] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %68 = llvm.load %67 : !llvm.ptr -> f32
    %69 = llvm.fadd %68, %62  : f32
    %70 = llvm.extractvalue %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %71 = llvm.mlir.constant(16 : index) : i64
    %72 = llvm.mul %27, %71  : i64
    %73 = llvm.add %72, %31  : i64
    %74 = llvm.getelementptr %70[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %69, %74 : f32, !llvm.ptr
    %75 = llvm.add %47, %46  : i64
    llvm.br ^bb5(%75 : i64)
  ^bb7:  // pred: ^bb5
    %76 = llvm.add %31, %30  : i64
    llvm.br ^bb3(%76 : i64)
  ^bb8:  // pred: ^bb3
    %77 = llvm.add %27, %26  : i64
    llvm.br ^bb1(%77 : i64)
  ^bb9:  // pred: ^bb1
    llvm.return
  }
  llvm.func @main() -> i32 {
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(16 : index) : i64
    %3 = llvm.mlir.constant(1 : index) : i64
    %4 = llvm.mlir.constant(256 : index) : i64
    %5 = llvm.alloca %4 x f32 : (i64) -> !llvm.ptr
    %6 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %7 = llvm.insertvalue %5, %6[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.insertvalue %5, %7[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(0 : index) : i64
    %10 = llvm.insertvalue %9, %8[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %1, %10[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %2, %11[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %2, %12[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %3, %13[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.mlir.constant(0 : index) : i64
    %16 = llvm.mlir.constant(16 : index) : i64
    %17 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%15 : i64)
  ^bb1(%18: i64):  // 2 preds: ^bb0, ^bb5
    %19 = llvm.icmp "slt" %18, %16 : i64
    llvm.cond_br %19, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    %20 = llvm.mlir.constant(0 : index) : i64
    %21 = llvm.mlir.constant(16 : index) : i64
    %22 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb3(%20 : i64)
  ^bb3(%23: i64):  // 2 preds: ^bb2, ^bb4
    %24 = llvm.icmp "slt" %23, %21 : i64
    llvm.cond_br %24, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %25 = llvm.mlir.constant(16 : index) : i64
    %26 = llvm.mul %18, %25  : i64
    %27 = llvm.add %26, %23  : i64
    %28 = llvm.getelementptr %5[%27] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %0, %28 : f32, !llvm.ptr
    %29 = llvm.add %23, %22  : i64
    llvm.br ^bb3(%29 : i64)
  ^bb5:  // pred: ^bb3
    %30 = llvm.add %18, %17  : i64
    llvm.br ^bb1(%30 : i64)
  ^bb6:  // pred: ^bb1
    %31 = llvm.mlir.constant(0 : index) : i64
    %32 = llvm.mlir.constant(16 : index) : i64
    %33 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb7(%31 : i64)
  ^bb7(%34: i64):  // 2 preds: ^bb6, ^bb14
    %35 = llvm.icmp "slt" %34, %32 : i64
    llvm.cond_br %35, ^bb8, ^bb15
  ^bb8:  // pred: ^bb7
    %36 = llvm.trunc %34 : i64 to i32
    %37 = llvm.mlir.constant(0 : index) : i64
    %38 = llvm.mlir.constant(16 : index) : i64
    %39 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb9(%37 : i64)
  ^bb9(%40: i64):  // 2 preds: ^bb8, ^bb13
    %41 = llvm.icmp "slt" %40, %38 : i64
    llvm.cond_br %41, ^bb10, ^bb14
  ^bb10:  // pred: ^bb9
    %42 = llvm.mlir.constant(16 : index) : i64
    %43 = llvm.mul %34, %42  : i64
    %44 = llvm.add %43, %40  : i64
    %45 = llvm.getelementptr %5[%44] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %46 = llvm.load %45 : !llvm.ptr -> f32
    %47 = llvm.fmul %46, %0  : f32
    %48 = llvm.mlir.constant(16 : index) : i64
    %49 = llvm.mul %34, %48  : i64
    %50 = llvm.add %49, %40  : i64
    %51 = llvm.getelementptr %5[%50] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %47, %51 : f32, !llvm.ptr
    %52 = llvm.trunc %40 : i64 to i32
    %53 = llvm.mlir.constant(0 : index) : i64
    %54 = llvm.mlir.constant(16 : index) : i64
    %55 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb11(%53 : i64)
  ^bb11(%56: i64):  // 2 preds: ^bb10, ^bb12
    %57 = llvm.icmp "slt" %56, %54 : i64
    llvm.cond_br %57, ^bb12, ^bb13
  ^bb12:  // pred: ^bb11
    %58 = llvm.trunc %56 : i64 to i32
    %59 = llvm.add %36, %58  : i32
    %60 = llvm.sitofp %59 : i32 to f32
    %61 = llvm.mul %58, %52  : i32
    %62 = llvm.sitofp %61 : i32 to f32
    %63 = llvm.fmul %60, %62  : f32
    %64 = llvm.mlir.constant(16 : index) : i64
    %65 = llvm.mul %34, %64  : i64
    %66 = llvm.add %65, %40  : i64
    %67 = llvm.getelementptr %5[%66] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %68 = llvm.load %67 : !llvm.ptr -> f32
    %69 = llvm.fadd %68, %63  : f32
    %70 = llvm.mlir.constant(16 : index) : i64
    %71 = llvm.mul %34, %70  : i64
    %72 = llvm.add %71, %40  : i64
    %73 = llvm.getelementptr %5[%72] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %69, %73 : f32, !llvm.ptr
    %74 = llvm.add %56, %55  : i64
    llvm.br ^bb11(%74 : i64)
  ^bb13:  // pred: ^bb11
    %75 = llvm.add %40, %39  : i64
    llvm.br ^bb9(%75 : i64)
  ^bb14:  // pred: ^bb9
    %76 = llvm.add %34, %33  : i64
    llvm.br ^bb7(%76 : i64)
  ^bb15:  // pred: ^bb7
    %77 = llvm.mlir.constant(0 : index) : i64
    %78 = llvm.mlir.constant(0 : index) : i64
    %79 = llvm.mlir.constant(16 : index) : i64
    %80 = llvm.mul %77, %79  : i64
    %81 = llvm.add %80, %78  : i64
    %82 = llvm.getelementptr %5[%81] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %83 = llvm.load %82 : !llvm.ptr -> f32
    %84 = llvm.fptosi %83 : f32 to i32
    llvm.return %84 : i32
  }
}

