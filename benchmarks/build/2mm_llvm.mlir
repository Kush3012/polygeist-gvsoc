module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i8, dense<[8, 32]> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i16, dense<[16, 32]> : vector<2xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i128, dense<128> : vector<2xi32>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>>, llvm.data_layout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128", llvm.target_triple = "aarch64-unknown-linux-gnu", "polygeist.target-cpu" = "generic", "polygeist.target-features" = "+fp-armv8,+neon,+outline-atomics,+v8a,-fmv"} {
  llvm.func @main() -> i32 {
    %0 = llvm.mlir.constant(true) : i1
    %1 = llvm.mlir.constant(3.200000e+01 : f32) : f32
    %2 = llvm.mlir.constant(1.500000e+00 : f32) : f32
    %3 = llvm.mlir.constant(1.200000e+00 : f32) : f32
    %4 = llvm.mlir.constant(1 : i32) : i32
    %5 = llvm.mlir.constant(3 : i32) : i32
    %6 = llvm.mlir.constant(2 : i32) : i32
    %7 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %8 = llvm.mlir.constant(32 : i32) : i32
    %9 = llvm.mlir.constant(32 : index) : i64
    %10 = llvm.mlir.constant(32 : index) : i64
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.mlir.constant(1024 : index) : i64
    %13 = llvm.alloca %12 x f32 : (i64) -> !llvm.ptr
    %14 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %15 = llvm.insertvalue %13, %14[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.insertvalue %13, %15[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.mlir.constant(0 : index) : i64
    %18 = llvm.insertvalue %17, %16[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.insertvalue %9, %18[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.insertvalue %10, %19[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.insertvalue %10, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.insertvalue %11, %21[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.mlir.constant(32 : index) : i64
    %24 = llvm.mlir.constant(32 : index) : i64
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.mlir.constant(1024 : index) : i64
    %27 = llvm.alloca %26 x f32 : (i64) -> !llvm.ptr
    %28 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %29 = llvm.insertvalue %27, %28[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %27, %29[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.mlir.constant(0 : index) : i64
    %32 = llvm.insertvalue %31, %30[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.insertvalue %23, %32[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %24, %33[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %24, %34[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %25, %35[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(32 : index) : i64
    %38 = llvm.mlir.constant(32 : index) : i64
    %39 = llvm.mlir.constant(1 : index) : i64
    %40 = llvm.mlir.constant(1024 : index) : i64
    %41 = llvm.alloca %40 x f32 : (i64) -> !llvm.ptr
    %42 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %43 = llvm.insertvalue %41, %42[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %44 = llvm.insertvalue %41, %43[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %45 = llvm.mlir.constant(0 : index) : i64
    %46 = llvm.insertvalue %45, %44[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.insertvalue %37, %46[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.insertvalue %38, %47[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.insertvalue %38, %48[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.insertvalue %39, %49[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.mlir.constant(32 : index) : i64
    %52 = llvm.mlir.constant(32 : index) : i64
    %53 = llvm.mlir.constant(1 : index) : i64
    %54 = llvm.mlir.constant(1024 : index) : i64
    %55 = llvm.alloca %54 x f32 : (i64) -> !llvm.ptr
    %56 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %57 = llvm.insertvalue %55, %56[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %58 = llvm.insertvalue %55, %57[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %59 = llvm.mlir.constant(0 : index) : i64
    %60 = llvm.insertvalue %59, %58[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %61 = llvm.insertvalue %51, %60[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %62 = llvm.insertvalue %52, %61[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %63 = llvm.insertvalue %52, %62[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %64 = llvm.insertvalue %53, %63[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %65 = llvm.mlir.constant(32 : index) : i64
    %66 = llvm.mlir.constant(32 : index) : i64
    %67 = llvm.mlir.constant(1 : index) : i64
    %68 = llvm.mlir.constant(1024 : index) : i64
    %69 = llvm.alloca %68 x f32 : (i64) -> !llvm.ptr
    %70 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %71 = llvm.insertvalue %69, %70[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %72 = llvm.insertvalue %69, %71[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %73 = llvm.mlir.constant(0 : index) : i64
    %74 = llvm.insertvalue %73, %72[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %75 = llvm.insertvalue %65, %74[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %76 = llvm.insertvalue %66, %75[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %77 = llvm.insertvalue %66, %76[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %78 = llvm.insertvalue %67, %77[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %79 = llvm.mlir.constant(0 : index) : i64
    %80 = llvm.mlir.constant(32 : index) : i64
    %81 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%79 : i64)
  ^bb1(%82: i64):  // 2 preds: ^bb0, ^bb5
    %83 = llvm.icmp "slt" %82, %80 : i64
    llvm.cond_br %83, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    %84 = llvm.trunc %82 : i64 to i32
    %85 = llvm.mlir.constant(0 : index) : i64
    %86 = llvm.mlir.constant(32 : index) : i64
    %87 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb3(%85 : i64)
  ^bb3(%88: i64):  // 2 preds: ^bb2, ^bb4
    %89 = llvm.icmp "slt" %88, %86 : i64
    llvm.cond_br %89, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %90 = llvm.trunc %88 : i64 to i32
    %91 = llvm.mul %84, %90  : i32
    %92 = llvm.srem %91, %8  : i32
    %93 = llvm.sitofp %92 : i32 to f32
    %94 = llvm.fdiv %93, %1  : f32
    %95 = llvm.mlir.constant(32 : index) : i64
    %96 = llvm.mul %82, %95  : i64
    %97 = llvm.add %96, %88  : i64
    %98 = llvm.getelementptr %55[%97] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %94, %98 : f32, !llvm.ptr
    %99 = llvm.add %88, %87  : i64
    llvm.br ^bb3(%99 : i64)
  ^bb5:  // pred: ^bb3
    %100 = llvm.add %82, %81  : i64
    llvm.br ^bb1(%100 : i64)
  ^bb6:  // pred: ^bb1
    %101 = llvm.mlir.constant(0 : index) : i64
    %102 = llvm.mlir.constant(32 : index) : i64
    %103 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb7(%101 : i64)
  ^bb7(%104: i64):  // 2 preds: ^bb6, ^bb11
    %105 = llvm.icmp "slt" %104, %102 : i64
    llvm.cond_br %105, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    %106 = llvm.trunc %104 : i64 to i32
    %107 = llvm.add %106, %4  : i32
    %108 = llvm.mlir.constant(0 : index) : i64
    %109 = llvm.mlir.constant(32 : index) : i64
    %110 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb9(%108 : i64)
  ^bb9(%111: i64):  // 2 preds: ^bb8, ^bb10
    %112 = llvm.icmp "slt" %111, %109 : i64
    llvm.cond_br %112, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %113 = llvm.trunc %111 : i64 to i32
    %114 = llvm.add %113, %4  : i32
    %115 = llvm.mul %107, %114  : i32
    %116 = llvm.srem %115, %8  : i32
    %117 = llvm.sitofp %116 : i32 to f32
    %118 = llvm.fdiv %117, %1  : f32
    %119 = llvm.mlir.constant(32 : index) : i64
    %120 = llvm.mul %104, %119  : i64
    %121 = llvm.add %120, %111  : i64
    %122 = llvm.getelementptr %41[%121] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %118, %122 : f32, !llvm.ptr
    %123 = llvm.add %111, %110  : i64
    llvm.br ^bb9(%123 : i64)
  ^bb11:  // pred: ^bb9
    %124 = llvm.add %104, %103  : i64
    llvm.br ^bb7(%124 : i64)
  ^bb12:  // pred: ^bb7
    %125 = llvm.mlir.constant(0 : index) : i64
    %126 = llvm.mlir.constant(32 : index) : i64
    %127 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb13(%125 : i64)
  ^bb13(%128: i64):  // 2 preds: ^bb12, ^bb17
    %129 = llvm.icmp "slt" %128, %126 : i64
    llvm.cond_br %129, ^bb14, ^bb18
  ^bb14:  // pred: ^bb13
    %130 = llvm.trunc %128 : i64 to i32
    %131 = llvm.mlir.constant(0 : index) : i64
    %132 = llvm.mlir.constant(32 : index) : i64
    %133 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb15(%131 : i64)
  ^bb15(%134: i64):  // 2 preds: ^bb14, ^bb16
    %135 = llvm.icmp "slt" %134, %132 : i64
    llvm.cond_br %135, ^bb16, ^bb17
  ^bb16:  // pred: ^bb15
    %136 = llvm.trunc %134 : i64 to i32
    %137 = llvm.add %136, %5  : i32
    %138 = llvm.mul %130, %137  : i32
    %139 = llvm.srem %138, %8  : i32
    %140 = llvm.sitofp %139 : i32 to f32
    %141 = llvm.fdiv %140, %1  : f32
    %142 = llvm.mlir.constant(32 : index) : i64
    %143 = llvm.mul %128, %142  : i64
    %144 = llvm.add %143, %134  : i64
    %145 = llvm.getelementptr %27[%144] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %141, %145 : f32, !llvm.ptr
    %146 = llvm.add %134, %133  : i64
    llvm.br ^bb15(%146 : i64)
  ^bb17:  // pred: ^bb15
    %147 = llvm.add %128, %127  : i64
    llvm.br ^bb13(%147 : i64)
  ^bb18:  // pred: ^bb13
    %148 = llvm.mlir.constant(0 : index) : i64
    %149 = llvm.mlir.constant(32 : index) : i64
    %150 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb19(%148 : i64)
  ^bb19(%151: i64):  // 2 preds: ^bb18, ^bb23
    %152 = llvm.icmp "slt" %151, %149 : i64
    llvm.cond_br %152, ^bb20, ^bb24
  ^bb20:  // pred: ^bb19
    %153 = llvm.trunc %151 : i64 to i32
    %154 = llvm.mlir.constant(0 : index) : i64
    %155 = llvm.mlir.constant(32 : index) : i64
    %156 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb21(%154 : i64)
  ^bb21(%157: i64):  // 2 preds: ^bb20, ^bb22
    %158 = llvm.icmp "slt" %157, %155 : i64
    llvm.cond_br %158, ^bb22, ^bb23
  ^bb22:  // pred: ^bb21
    %159 = llvm.trunc %157 : i64 to i32
    %160 = llvm.add %159, %6  : i32
    %161 = llvm.mul %153, %160  : i32
    %162 = llvm.srem %161, %8  : i32
    %163 = llvm.sitofp %162 : i32 to f32
    %164 = llvm.fdiv %163, %1  : f32
    %165 = llvm.mlir.constant(32 : index) : i64
    %166 = llvm.mul %151, %165  : i64
    %167 = llvm.add %166, %157  : i64
    %168 = llvm.getelementptr %13[%167] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %164, %168 : f32, !llvm.ptr
    %169 = llvm.add %157, %156  : i64
    llvm.br ^bb21(%169 : i64)
  ^bb23:  // pred: ^bb21
    %170 = llvm.add %151, %150  : i64
    llvm.br ^bb19(%170 : i64)
  ^bb24:  // pred: ^bb19
    llvm.call @kernel_2mm(%8, %8, %8, %8, %2, %3, %69, %69, %73, %65, %66, %66, %67, %55, %55, %59, %51, %52, %52, %53, %41, %41, %45, %37, %38, %38, %39, %27, %27, %31, %23, %24, %24, %25, %13, %13, %17, %9, %10, %10, %11) : (i32, i32, i32, i32, f32, f32, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    %171 = llvm.mlir.constant(0 : index) : i64
    %172 = llvm.mlir.constant(32 : index) : i64
    %173 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb25(%171, %7 : i64, f32)
  ^bb25(%174: i64, %175: f32):  // 2 preds: ^bb24, ^bb29
    %176 = llvm.icmp "slt" %174, %172 : i64
    llvm.cond_br %176, ^bb26, ^bb30
  ^bb26:  // pred: ^bb25
    %177 = llvm.mlir.constant(0 : index) : i64
    %178 = llvm.mlir.constant(32 : index) : i64
    %179 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb27(%177, %175 : i64, f32)
  ^bb27(%180: i64, %181: f32):  // 2 preds: ^bb26, ^bb28
    %182 = llvm.icmp "slt" %180, %178 : i64
    llvm.cond_br %182, ^bb28, ^bb29
  ^bb28:  // pred: ^bb27
    %183 = llvm.mlir.constant(32 : index) : i64
    %184 = llvm.mul %174, %183  : i64
    %185 = llvm.add %184, %180  : i64
    %186 = llvm.getelementptr %13[%185] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %187 = llvm.load %186 : !llvm.ptr -> f32
    %188 = llvm.fadd %181, %187  : f32
    %189 = llvm.add %180, %179  : i64
    llvm.br ^bb27(%189, %188 : i64, f32)
  ^bb29:  // pred: ^bb27
    %190 = llvm.add %174, %173  : i64
    llvm.br ^bb25(%190, %181 : i64, f32)
  ^bb30:  // pred: ^bb25
    %191 = llvm.fcmp "ogt" %175, %7 : f32
    %192 = llvm.xor %191, %0  : i1
    %193 = llvm.zext %192 : i1 to i32
    llvm.return %193 : i32
  }
  llvm.func internal @kernel_2mm(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: f32, %arg5: f32, %arg6: !llvm.ptr, %arg7: !llvm.ptr, %arg8: i64, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: !llvm.ptr, %arg14: !llvm.ptr, %arg15: i64, %arg16: i64, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: !llvm.ptr, %arg21: !llvm.ptr, %arg22: i64, %arg23: i64, %arg24: i64, %arg25: i64, %arg26: i64, %arg27: !llvm.ptr, %arg28: !llvm.ptr, %arg29: i64, %arg30: i64, %arg31: i64, %arg32: i64, %arg33: i64, %arg34: !llvm.ptr, %arg35: !llvm.ptr, %arg36: i64, %arg37: i64, %arg38: i64, %arg39: i64, %arg40: i64) attributes {sym_visibility = "private"} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg6, %0[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg7, %1[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.insertvalue %arg8, %2[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.insertvalue %arg9, %3[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.insertvalue %arg11, %4[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.insertvalue %arg10, %5[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.insertvalue %arg12, %6[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %9 = llvm.insertvalue %arg13, %8[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.insertvalue %arg14, %9[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %arg15, %10[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %arg16, %11[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %arg18, %12[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %arg17, %13[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg19, %14[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %17 = llvm.insertvalue %arg20, %16[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.insertvalue %arg21, %17[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.insertvalue %arg22, %18[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.insertvalue %arg23, %19[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.insertvalue %arg25, %20[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.insertvalue %arg24, %21[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.insertvalue %arg26, %22[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %25 = llvm.insertvalue %arg27, %24[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.insertvalue %arg28, %25[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.insertvalue %arg29, %26[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.insertvalue %arg30, %27[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.insertvalue %arg32, %28[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %arg31, %29[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.insertvalue %arg33, %30[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %33 = llvm.insertvalue %arg34, %32[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %arg35, %33[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %arg36, %34[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %arg37, %35[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.insertvalue %arg39, %36[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %38 = llvm.insertvalue %arg38, %37[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.insertvalue %arg40, %38[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %40 = llvm.mlir.constant(0 : index) : i64
    %41 = llvm.mlir.constant(1 : index) : i64
    %42 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %43 = llvm.sext %arg2 : i32 to i64
    %44 = llvm.sext %arg3 : i32 to i64
    %45 = llvm.sext %arg1 : i32 to i64
    omp.parallel   {
      %46 = llvm.sext %arg0 : i32 to i64
      omp.wsloop   for  (%arg41) : i64 = (%40) to (%46) step (%41) {
        %47 = llvm.mlir.constant(0 : index) : i64
        %48 = llvm.mlir.constant(1 : index) : i64
        llvm.br ^bb1(%47 : i64)
      ^bb1(%49: i64):  // 2 preds: ^bb0, ^bb5
        %50 = llvm.icmp "slt" %49, %45 : i64
        llvm.cond_br %50, ^bb2, ^bb6
      ^bb2:  // pred: ^bb1
        %51 = llvm.mlir.constant(32 : index) : i64
        %52 = llvm.mul %arg41, %51  : i64
        %53 = llvm.add %52, %49  : i64
        %54 = llvm.getelementptr %arg7[%53] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %42, %54 : f32, !llvm.ptr
        %55 = llvm.mlir.constant(0 : index) : i64
        %56 = llvm.mlir.constant(1 : index) : i64
        llvm.br ^bb3(%55 : i64)
      ^bb3(%57: i64):  // 2 preds: ^bb2, ^bb4
        %58 = llvm.icmp "slt" %57, %43 : i64
        llvm.cond_br %58, ^bb4, ^bb5
      ^bb4:  // pred: ^bb3
        %59 = llvm.mlir.constant(32 : index) : i64
        %60 = llvm.mul %arg41, %59  : i64
        %61 = llvm.add %60, %57  : i64
        %62 = llvm.getelementptr %arg14[%61] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %63 = llvm.load %62 : !llvm.ptr -> f32
        %64 = llvm.fmul %arg4, %63  : f32
        %65 = llvm.mlir.constant(32 : index) : i64
        %66 = llvm.mul %57, %65  : i64
        %67 = llvm.add %66, %49  : i64
        %68 = llvm.getelementptr %arg21[%67] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %69 = llvm.load %68 : !llvm.ptr -> f32
        %70 = llvm.fmul %64, %69  : f32
        %71 = llvm.mlir.constant(32 : index) : i64
        %72 = llvm.mul %arg41, %71  : i64
        %73 = llvm.add %72, %49  : i64
        %74 = llvm.getelementptr %arg7[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %75 = llvm.load %74 : !llvm.ptr -> f32
        %76 = llvm.fadd %75, %70  : f32
        %77 = llvm.mlir.constant(32 : index) : i64
        %78 = llvm.mul %arg41, %77  : i64
        %79 = llvm.add %78, %49  : i64
        %80 = llvm.getelementptr %arg7[%79] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %76, %80 : f32, !llvm.ptr
        %81 = llvm.add %57, %56  : i64
        llvm.br ^bb3(%81 : i64)
      ^bb5:  // pred: ^bb3
        %82 = llvm.add %49, %48  : i64
        llvm.br ^bb1(%82 : i64)
      ^bb6:  // pred: ^bb1
        omp.yield
      }
      omp.terminator
    }
    omp.parallel   {
      %46 = llvm.sext %arg0 : i32 to i64
      omp.wsloop   for  (%arg41) : i64 = (%40) to (%46) step (%41) {
        %47 = llvm.mlir.constant(0 : index) : i64
        %48 = llvm.mlir.constant(1 : index) : i64
        llvm.br ^bb1(%47 : i64)
      ^bb1(%49: i64):  // 2 preds: ^bb0, ^bb5
        %50 = llvm.icmp "slt" %49, %44 : i64
        llvm.cond_br %50, ^bb2, ^bb6
      ^bb2:  // pred: ^bb1
        %51 = llvm.mlir.constant(32 : index) : i64
        %52 = llvm.mul %arg41, %51  : i64
        %53 = llvm.add %52, %49  : i64
        %54 = llvm.getelementptr %arg35[%53] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %55 = llvm.load %54 : !llvm.ptr -> f32
        %56 = llvm.fmul %55, %arg5  : f32
        %57 = llvm.mlir.constant(32 : index) : i64
        %58 = llvm.mul %arg41, %57  : i64
        %59 = llvm.add %58, %49  : i64
        %60 = llvm.getelementptr %arg35[%59] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %56, %60 : f32, !llvm.ptr
        %61 = llvm.mlir.constant(0 : index) : i64
        %62 = llvm.mlir.constant(1 : index) : i64
        llvm.br ^bb3(%61 : i64)
      ^bb3(%63: i64):  // 2 preds: ^bb2, ^bb4
        %64 = llvm.icmp "slt" %63, %45 : i64
        llvm.cond_br %64, ^bb4, ^bb5
      ^bb4:  // pred: ^bb3
        %65 = llvm.mlir.constant(32 : index) : i64
        %66 = llvm.mul %arg41, %65  : i64
        %67 = llvm.add %66, %63  : i64
        %68 = llvm.getelementptr %arg7[%67] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %69 = llvm.load %68 : !llvm.ptr -> f32
        %70 = llvm.mlir.constant(32 : index) : i64
        %71 = llvm.mul %63, %70  : i64
        %72 = llvm.add %71, %49  : i64
        %73 = llvm.getelementptr %arg28[%72] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %74 = llvm.load %73 : !llvm.ptr -> f32
        %75 = llvm.fmul %69, %74  : f32
        %76 = llvm.mlir.constant(32 : index) : i64
        %77 = llvm.mul %arg41, %76  : i64
        %78 = llvm.add %77, %49  : i64
        %79 = llvm.getelementptr %arg35[%78] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %80 = llvm.load %79 : !llvm.ptr -> f32
        %81 = llvm.fadd %80, %75  : f32
        %82 = llvm.mlir.constant(32 : index) : i64
        %83 = llvm.mul %arg41, %82  : i64
        %84 = llvm.add %83, %49  : i64
        %85 = llvm.getelementptr %arg35[%84] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %81, %85 : f32, !llvm.ptr
        %86 = llvm.add %63, %62  : i64
        llvm.br ^bb3(%86 : i64)
      ^bb5:  // pred: ^bb3
        %87 = llvm.add %49, %48  : i64
        llvm.br ^bb1(%87 : i64)
      ^bb6:  // pred: ^bb1
        omp.yield
      }
      omp.terminator
    }
    llvm.return
  }
}

