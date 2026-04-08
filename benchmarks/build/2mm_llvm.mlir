module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>, #dlti.dl_entry<"dlti.endianness", "little">>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
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
    %37 = llvm.mlir.constant(0 : index) : i64
    %38 = llvm.mlir.constant(32 : index) : i64
    %39 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%37 : i64)
  ^bb1(%40: i64):  // 2 preds: ^bb0, ^bb5
    %41 = llvm.icmp "slt" %40, %38 : i64
    llvm.cond_br %41, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    %42 = llvm.trunc %40 : i64 to i32
    %43 = llvm.mlir.constant(0 : index) : i64
    %44 = llvm.mlir.constant(32 : index) : i64
    %45 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb3(%43 : i64)
  ^bb3(%46: i64):  // 2 preds: ^bb2, ^bb4
    %47 = llvm.icmp "slt" %46, %44 : i64
    llvm.cond_br %47, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %48 = llvm.trunc %46 : i64 to i32
    %49 = llvm.add %48, %6  : i32
    %50 = llvm.mul %42, %49  : i32
    %51 = llvm.srem %50, %8  : i32
    %52 = llvm.sitofp %51 : i32 to f32
    %53 = llvm.fdiv %52, %1  : f32
    %54 = llvm.mlir.constant(32 : index) : i64
    %55 = llvm.mul %40, %54  : i64
    %56 = llvm.add %55, %46  : i64
    %57 = llvm.getelementptr %13[%56] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %53, %57 : f32, !llvm.ptr
    %58 = llvm.add %46, %45  : i64
    llvm.br ^bb3(%58 : i64)
  ^bb5:  // pred: ^bb3
    %59 = llvm.add %40, %39  : i64
    llvm.br ^bb1(%59 : i64)
  ^bb6:  // pred: ^bb1
    %60 = llvm.mlir.constant(0 : index) : i64
    %61 = llvm.mlir.constant(32 : index) : i64
    %62 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb7(%60 : i64)
  ^bb7(%63: i64):  // 2 preds: ^bb6, ^bb14
    %64 = llvm.icmp "slt" %63, %61 : i64
    llvm.cond_br %64, ^bb8, ^bb15
  ^bb8:  // pred: ^bb7
    %65 = llvm.trunc %63 : i64 to i32
    %66 = llvm.mlir.constant(0 : index) : i64
    %67 = llvm.mlir.constant(32 : index) : i64
    %68 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb9(%66 : i64)
  ^bb9(%69: i64):  // 2 preds: ^bb8, ^bb13
    %70 = llvm.icmp "slt" %69, %67 : i64
    llvm.cond_br %70, ^bb10, ^bb14
  ^bb10:  // pred: ^bb9
    %71 = llvm.mlir.constant(32 : index) : i64
    %72 = llvm.mul %63, %71  : i64
    %73 = llvm.add %72, %69  : i64
    %74 = llvm.getelementptr %27[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %7, %74 : f32, !llvm.ptr
    %75 = llvm.trunc %69 : i64 to i32
    %76 = llvm.add %75, %4  : i32
    %77 = llvm.mlir.constant(0 : index) : i64
    %78 = llvm.mlir.constant(32 : index) : i64
    %79 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb11(%77 : i64)
  ^bb11(%80: i64):  // 2 preds: ^bb10, ^bb12
    %81 = llvm.icmp "slt" %80, %78 : i64
    llvm.cond_br %81, ^bb12, ^bb13
  ^bb12:  // pred: ^bb11
    %82 = llvm.trunc %80 : i64 to i32
    %83 = llvm.mul %65, %82  : i32
    %84 = llvm.srem %83, %8  : i32
    %85 = llvm.sitofp %84 : i32 to f32
    %86 = llvm.fdiv %85, %1  : f32
    %87 = llvm.fmul %86, %2  : f32
    %88 = llvm.add %82, %4  : i32
    %89 = llvm.mul %88, %76  : i32
    %90 = llvm.srem %89, %8  : i32
    %91 = llvm.sitofp %90 : i32 to f32
    %92 = llvm.fdiv %91, %1  : f32
    %93 = llvm.fmul %87, %92  : f32
    %94 = llvm.mlir.constant(32 : index) : i64
    %95 = llvm.mul %63, %94  : i64
    %96 = llvm.add %95, %69  : i64
    %97 = llvm.getelementptr %27[%96] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %98 = llvm.load %97 : !llvm.ptr -> f32
    %99 = llvm.fadd %98, %93  : f32
    %100 = llvm.mlir.constant(32 : index) : i64
    %101 = llvm.mul %63, %100  : i64
    %102 = llvm.add %101, %69  : i64
    %103 = llvm.getelementptr %27[%102] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %99, %103 : f32, !llvm.ptr
    %104 = llvm.add %80, %79  : i64
    llvm.br ^bb11(%104 : i64)
  ^bb13:  // pred: ^bb11
    %105 = llvm.add %69, %68  : i64
    llvm.br ^bb9(%105 : i64)
  ^bb14:  // pred: ^bb9
    %106 = llvm.add %63, %62  : i64
    llvm.br ^bb7(%106 : i64)
  ^bb15:  // pred: ^bb7
    %107 = llvm.mlir.constant(0 : index) : i64
    %108 = llvm.mlir.constant(32 : index) : i64
    %109 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb16(%107 : i64)
  ^bb16(%110: i64):  // 2 preds: ^bb15, ^bb23
    %111 = llvm.icmp "slt" %110, %108 : i64
    llvm.cond_br %111, ^bb17, ^bb24
  ^bb17:  // pred: ^bb16
    %112 = llvm.mlir.constant(0 : index) : i64
    %113 = llvm.mlir.constant(32 : index) : i64
    %114 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb18(%112 : i64)
  ^bb18(%115: i64):  // 2 preds: ^bb17, ^bb22
    %116 = llvm.icmp "slt" %115, %113 : i64
    llvm.cond_br %116, ^bb19, ^bb23
  ^bb19:  // pred: ^bb18
    %117 = llvm.mlir.constant(32 : index) : i64
    %118 = llvm.mul %110, %117  : i64
    %119 = llvm.add %118, %115  : i64
    %120 = llvm.getelementptr %13[%119] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %121 = llvm.load %120 : !llvm.ptr -> f32
    %122 = llvm.fmul %121, %3  : f32
    %123 = llvm.mlir.constant(32 : index) : i64
    %124 = llvm.mul %110, %123  : i64
    %125 = llvm.add %124, %115  : i64
    %126 = llvm.getelementptr %13[%125] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %122, %126 : f32, !llvm.ptr
    %127 = llvm.trunc %115 : i64 to i32
    %128 = llvm.add %127, %5  : i32
    %129 = llvm.mlir.constant(0 : index) : i64
    %130 = llvm.mlir.constant(32 : index) : i64
    %131 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb20(%129 : i64)
  ^bb20(%132: i64):  // 2 preds: ^bb19, ^bb21
    %133 = llvm.icmp "slt" %132, %130 : i64
    llvm.cond_br %133, ^bb21, ^bb22
  ^bb21:  // pred: ^bb20
    %134 = llvm.mlir.constant(32 : index) : i64
    %135 = llvm.mul %110, %134  : i64
    %136 = llvm.add %135, %132  : i64
    %137 = llvm.getelementptr %27[%136] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %138 = llvm.load %137 : !llvm.ptr -> f32
    %139 = llvm.trunc %132 : i64 to i32
    %140 = llvm.mul %139, %128  : i32
    %141 = llvm.srem %140, %8  : i32
    %142 = llvm.sitofp %141 : i32 to f32
    %143 = llvm.fdiv %142, %1  : f32
    %144 = llvm.fmul %138, %143  : f32
    %145 = llvm.mlir.constant(32 : index) : i64
    %146 = llvm.mul %110, %145  : i64
    %147 = llvm.add %146, %115  : i64
    %148 = llvm.getelementptr %13[%147] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %149 = llvm.load %148 : !llvm.ptr -> f32
    %150 = llvm.fadd %149, %144  : f32
    %151 = llvm.mlir.constant(32 : index) : i64
    %152 = llvm.mul %110, %151  : i64
    %153 = llvm.add %152, %115  : i64
    %154 = llvm.getelementptr %13[%153] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %150, %154 : f32, !llvm.ptr
    %155 = llvm.add %132, %131  : i64
    llvm.br ^bb20(%155 : i64)
  ^bb22:  // pred: ^bb20
    %156 = llvm.add %115, %114  : i64
    llvm.br ^bb18(%156 : i64)
  ^bb23:  // pred: ^bb18
    %157 = llvm.add %110, %109  : i64
    llvm.br ^bb16(%157 : i64)
  ^bb24:  // pred: ^bb16
    %158 = llvm.mlir.constant(0 : index) : i64
    %159 = llvm.mlir.constant(32 : index) : i64
    %160 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb25(%158, %7 : i64, f32)
  ^bb25(%161: i64, %162: f32):  // 2 preds: ^bb24, ^bb29
    %163 = llvm.icmp "slt" %161, %159 : i64
    llvm.cond_br %163, ^bb26, ^bb30
  ^bb26:  // pred: ^bb25
    %164 = llvm.mlir.constant(0 : index) : i64
    %165 = llvm.mlir.constant(32 : index) : i64
    %166 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb27(%164, %162 : i64, f32)
  ^bb27(%167: i64, %168: f32):  // 2 preds: ^bb26, ^bb28
    %169 = llvm.icmp "slt" %167, %165 : i64
    llvm.cond_br %169, ^bb28, ^bb29
  ^bb28:  // pred: ^bb27
    %170 = llvm.mlir.constant(32 : index) : i64
    %171 = llvm.mul %161, %170  : i64
    %172 = llvm.add %171, %167  : i64
    %173 = llvm.getelementptr %13[%172] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %174 = llvm.load %173 : !llvm.ptr -> f32
    %175 = llvm.fadd %168, %174  : f32
    %176 = llvm.add %167, %166  : i64
    llvm.br ^bb27(%176, %175 : i64, f32)
  ^bb29:  // pred: ^bb27
    %177 = llvm.add %161, %160  : i64
    llvm.br ^bb25(%177, %168 : i64, f32)
  ^bb30:  // pred: ^bb25
    %178 = llvm.fcmp "ogt" %162, %7 : f32
    %179 = llvm.xor %178, %0  : i1
    %180 = llvm.zext %179 : i1 to i32
    llvm.return %180 : i32
  }
}

