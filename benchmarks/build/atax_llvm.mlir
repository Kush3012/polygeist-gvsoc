module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i128, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<i8, dense<[8, 32]> : vector<2xi32>>, #dlti.dl_entry<i16, dense<[16, 32]> : vector<2xi32>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>, #dlti.dl_entry<"dlti.endianness", "little">>, llvm.data_layout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128", llvm.target_triple = "aarch64-unknown-linux-gnu", "polygeist.target-cpu" = "generic", "polygeist.target-features" = "+fp-armv8,+neon,+outline-atomics,+v8a,-fmv"} {
  llvm.func @main() -> i32 {
    %0 = llvm.mlir.constant(3.200000e+01 : f32) : f32
    %1 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    %2 = llvm.mlir.constant(1 : i32) : i32
    %3 = llvm.mlir.constant(true) : i1
    %4 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %5 = llvm.mlir.constant(32 : i32) : i32
    %6 = llvm.mlir.constant(32 : index) : i64
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.alloca %6 x f32 : (i64) -> !llvm.ptr
    %9 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %10 = llvm.insertvalue %8, %9[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %8, %10[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.insertvalue %12, %11[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.insertvalue %6, %13[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %15 = llvm.insertvalue %7, %14[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.mlir.constant(32 : index) : i64
    %17 = llvm.mlir.constant(1 : index) : i64
    %18 = llvm.alloca %16 x f32 : (i64) -> !llvm.ptr
    %19 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %20 = llvm.insertvalue %18, %19[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.insertvalue %18, %20[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.mlir.constant(0 : index) : i64
    %23 = llvm.insertvalue %22, %21[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %24 = llvm.insertvalue %16, %23[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.insertvalue %17, %24[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %26 = llvm.mlir.constant(32 : index) : i64
    %27 = llvm.mlir.constant(1 : index) : i64
    %28 = llvm.alloca %26 x f32 : (i64) -> !llvm.ptr
    %29 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %30 = llvm.insertvalue %28, %29[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %31 = llvm.insertvalue %28, %30[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %32 = llvm.mlir.constant(0 : index) : i64
    %33 = llvm.insertvalue %32, %31[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %34 = llvm.insertvalue %26, %33[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %35 = llvm.insertvalue %27, %34[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
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
  ^bb1(%53: i64):  // 2 preds: ^bb0, ^bb2
    %54 = llvm.icmp "slt" %53, %51 : i64
    llvm.cond_br %54, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %55 = llvm.trunc %53 : i64 to i32
    %56 = llvm.sitofp %55 : i32 to f32
    %57 = llvm.fdiv %56, %0  : f32
    %58 = llvm.fadd %57, %1  : f32
    %59 = llvm.getelementptr %28[%53] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %58, %59 : f32, !llvm.ptr
    %60 = llvm.add %53, %52  : i64
    llvm.br ^bb1(%60 : i64)
  ^bb3:  // pred: ^bb1
    %61 = llvm.mlir.constant(0 : index) : i64
    %62 = llvm.mlir.constant(32 : index) : i64
    %63 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb4(%61 : i64)
  ^bb4(%64: i64):  // 2 preds: ^bb3, ^bb8
    %65 = llvm.icmp "slt" %64, %62 : i64
    llvm.cond_br %65, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    %66 = llvm.trunc %64 : i64 to i32
    %67 = llvm.mlir.constant(0 : index) : i64
    %68 = llvm.mlir.constant(32 : index) : i64
    %69 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb6(%67 : i64)
  ^bb6(%70: i64):  // 2 preds: ^bb5, ^bb7
    %71 = llvm.icmp "slt" %70, %68 : i64
    llvm.cond_br %71, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %72 = llvm.trunc %70 : i64 to i32
    %73 = llvm.add %72, %2  : i32
    %74 = llvm.mul %66, %73  : i32
    %75 = llvm.sitofp %74 : i32 to f32
    %76 = llvm.fdiv %75, %0  : f32
    %77 = llvm.mlir.constant(32 : index) : i64
    %78 = llvm.mul %64, %77  : i64
    %79 = llvm.add %78, %70  : i64
    %80 = llvm.getelementptr %40[%79] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %76, %80 : f32, !llvm.ptr
    %81 = llvm.add %70, %69  : i64
    llvm.br ^bb6(%81 : i64)
  ^bb8:  // pred: ^bb6
    %82 = llvm.add %64, %63  : i64
    llvm.br ^bb4(%82 : i64)
  ^bb9:  // pred: ^bb4
    llvm.call @kernel_atax(%5, %5, %40, %40, %44, %36, %37, %37, %38, %28, %28, %32, %26, %27, %18, %18, %22, %16, %17, %8, %8, %12, %6, %7) : (i32, i32, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64) -> ()
    %83 = llvm.mlir.constant(0 : index) : i64
    %84 = llvm.mlir.constant(32 : index) : i64
    %85 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb10(%83, %4 : i64, f32)
  ^bb10(%86: i64, %87: f32):  // 2 preds: ^bb9, ^bb11
    %88 = llvm.icmp "slt" %86, %84 : i64
    llvm.cond_br %88, ^bb11, ^bb12
  ^bb11:  // pred: ^bb10
    %89 = llvm.getelementptr %18[%86] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %90 = llvm.load %89 : !llvm.ptr -> f32
    %91 = llvm.fadd %87, %90  : f32
    %92 = llvm.add %86, %85  : i64
    llvm.br ^bb10(%92, %91 : i64, f32)
  ^bb12:  // pred: ^bb10
    %93 = llvm.fcmp "ogt" %87, %4 : f32
    %94 = llvm.xor %93, %3  : i1
    %95 = llvm.zext %94 : i1 to i32
    llvm.return %95 : i32
  }
  llvm.func internal @kernel_atax(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: i64, %arg9: !llvm.ptr, %arg10: !llvm.ptr, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: !llvm.ptr, %arg15: !llvm.ptr, %arg16: i64, %arg17: i64, %arg18: i64, %arg19: !llvm.ptr, %arg20: !llvm.ptr, %arg21: i64, %arg22: i64, %arg23: i64) attributes {sym_visibility = "private"} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg2, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg3, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg4, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg5, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg7, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg6, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg8, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %9 = llvm.insertvalue %arg9, %8[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %10 = llvm.insertvalue %arg10, %9[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg11, %10[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.insertvalue %arg12, %11[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %13 = llvm.insertvalue %arg13, %12[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %15 = llvm.insertvalue %arg14, %14[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.insertvalue %arg15, %15[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %17 = llvm.insertvalue %arg16, %16[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.insertvalue %arg17, %17[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %19 = llvm.insertvalue %arg18, %18[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %21 = llvm.insertvalue %arg19, %20[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.insertvalue %arg20, %21[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %23 = llvm.insertvalue %arg21, %22[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %24 = llvm.insertvalue %arg22, %23[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.insertvalue %arg23, %24[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %26 = llvm.mlir.constant(0 : index) : i64
    %27 = llvm.mlir.constant(1 : index) : i64
    %28 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %29 = llvm.sext %arg1 : i32 to i64
    omp.parallel   {
      omp.wsloop   for  (%arg24) : i64 = (%26) to (%29) step (%27) {
        %31 = llvm.getelementptr %arg15[%arg24] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %28, %31 : f32, !llvm.ptr
        omp.yield
      }
      %30 = llvm.sext %arg0 : i32 to i64
      omp.wsloop   for  (%arg24) : i64 = (%26) to (%30) step (%27) {
        %31 = llvm.getelementptr %arg20[%arg24] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %28, %31 : f32, !llvm.ptr
        %32 = llvm.mlir.constant(0 : index) : i64
        %33 = llvm.mlir.constant(1 : index) : i64
        llvm.br ^bb1(%32 : i64)
      ^bb1(%34: i64):  // 2 preds: ^bb0, ^bb2
        %35 = llvm.icmp "slt" %34, %29 : i64
        llvm.cond_br %35, ^bb2, ^bb3
      ^bb2:  // pred: ^bb1
        %36 = llvm.mlir.constant(32 : index) : i64
        %37 = llvm.mul %arg24, %36  : i64
        %38 = llvm.add %37, %34  : i64
        %39 = llvm.getelementptr %arg3[%38] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %40 = llvm.load %39 : !llvm.ptr -> f32
        %41 = llvm.getelementptr %arg10[%34] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %42 = llvm.load %41 : !llvm.ptr -> f32
        %43 = llvm.fmul %40, %42  : f32
        %44 = llvm.getelementptr %arg20[%arg24] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %45 = llvm.load %44 : !llvm.ptr -> f32
        %46 = llvm.fadd %45, %43  : f32
        %47 = llvm.getelementptr %arg20[%arg24] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %46, %47 : f32, !llvm.ptr
        %48 = llvm.add %34, %33  : i64
        llvm.br ^bb1(%48 : i64)
      ^bb3:  // pred: ^bb1
        %49 = llvm.mlir.constant(0 : index) : i64
        %50 = llvm.mlir.constant(1 : index) : i64
        llvm.br ^bb4(%49 : i64)
      ^bb4(%51: i64):  // 2 preds: ^bb3, ^bb5
        %52 = llvm.icmp "slt" %51, %29 : i64
        llvm.cond_br %52, ^bb5, ^bb6
      ^bb5:  // pred: ^bb4
        %53 = llvm.mlir.constant(32 : index) : i64
        %54 = llvm.mul %arg24, %53  : i64
        %55 = llvm.add %54, %51  : i64
        %56 = llvm.getelementptr %arg3[%55] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %57 = llvm.load %56 : !llvm.ptr -> f32
        %58 = llvm.getelementptr %arg20[%arg24] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %59 = llvm.load %58 : !llvm.ptr -> f32
        %60 = llvm.fmul %57, %59  : f32
        %61 = llvm.getelementptr %arg15[%51] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %62 = llvm.load %61 : !llvm.ptr -> f32
        %63 = llvm.fadd %62, %60  : f32
        %64 = llvm.getelementptr %arg15[%51] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %63, %64 : f32, !llvm.ptr
        %65 = llvm.add %51, %50  : i64
        llvm.br ^bb4(%65 : i64)
      ^bb6:  // pred: ^bb4
        omp.yield
      }
      omp.terminator
    }
    llvm.return
  }
}

