module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<!llvm.ptr<270>, dense<32> : vector<4xi32>>, #dlti.dl_entry<!llvm.ptr<271>, dense<32> : vector<4xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f80, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr<272>, dense<64> : vector<4xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<i16, dense<16> : vector<2xi32>>, #dlti.dl_entry<i8, dense<8> : vector<2xi32>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>>, llvm.data_layout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128", llvm.target_triple = "x86_64-unknown-linux-gnu", "polygeist.target-cpu" = "x86-64", "polygeist.target-features" = "+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87", "polygeist.tune-cpu" = "generic"} {
  llvm.func @main() -> i32 {
    %0 = llvm.mlir.constant(1.600000e+02 : f32) : f32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.mlir.constant(3 : i32) : i32
    %3 = llvm.mlir.constant(2 : i32) : i32
    %4 = llvm.mlir.constant(true) : i1
    %5 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %6 = llvm.mlir.constant(32 : i32) : i32
    %7 = llvm.mlir.constant(32 : index) : i64
    %8 = llvm.mlir.constant(32 : index) : i64
    %9 = llvm.mlir.constant(1 : index) : i64
    %10 = llvm.mlir.constant(1024 : index) : i64
    %11 = llvm.alloca %10 x f32 : (i64) -> !llvm.ptr
    %12 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %13 = llvm.insertvalue %11, %12[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.insertvalue %11, %13[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.mlir.constant(0 : index) : i64
    %16 = llvm.insertvalue %15, %14[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %17 = llvm.insertvalue %7, %16[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.insertvalue %8, %17[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.insertvalue %8, %18[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.insertvalue %9, %19[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.mlir.constant(32 : index) : i64
    %22 = llvm.mlir.constant(32 : index) : i64
    %23 = llvm.mlir.constant(1 : index) : i64
    %24 = llvm.mlir.constant(1024 : index) : i64
    %25 = llvm.alloca %24 x f32 : (i64) -> !llvm.ptr
    %26 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %27 = llvm.insertvalue %25, %26[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.insertvalue %25, %27[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.mlir.constant(0 : index) : i64
    %30 = llvm.insertvalue %29, %28[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.insertvalue %21, %30[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.insertvalue %22, %31[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.insertvalue %22, %32[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %23, %33[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.mlir.constant(32 : index) : i64
    %36 = llvm.mlir.constant(32 : index) : i64
    %37 = llvm.mlir.constant(1 : index) : i64
    %38 = llvm.mlir.constant(1024 : index) : i64
    %39 = llvm.alloca %38 x f32 : (i64) -> !llvm.ptr
    %40 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %41 = llvm.insertvalue %39, %40[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %42 = llvm.insertvalue %39, %41[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %43 = llvm.mlir.constant(0 : index) : i64
    %44 = llvm.insertvalue %43, %42[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %45 = llvm.insertvalue %35, %44[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %46 = llvm.insertvalue %36, %45[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.insertvalue %36, %46[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.insertvalue %37, %47[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.mlir.constant(0 : index) : i64
    %50 = llvm.mlir.constant(32 : index) : i64
    %51 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%49 : i64)
  ^bb1(%52: i64):  // 2 preds: ^bb0, ^bb8
    %53 = llvm.icmp "slt" %52, %50 : i64
    llvm.cond_br %53, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    %54 = llvm.trunc %52 : i64 to i32
    %55 = llvm.mlir.constant(0 : index) : i64
    %56 = llvm.mlir.constant(32 : index) : i64
    %57 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb3(%55 : i64)
  ^bb3(%58: i64):  // 2 preds: ^bb2, ^bb7
    %59 = llvm.icmp "slt" %58, %56 : i64
    llvm.cond_br %59, ^bb4, ^bb8
  ^bb4:  // pred: ^bb3
    %60 = llvm.mlir.constant(32 : index) : i64
    %61 = llvm.mul %52, %60  : i64
    %62 = llvm.add %61, %58  : i64
    %63 = llvm.getelementptr %39[%62] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %5, %63 : f32, !llvm.ptr
    %64 = llvm.trunc %58 : i64 to i32
    %65 = llvm.add %64, %1  : i32
    %66 = llvm.mlir.constant(0 : index) : i64
    %67 = llvm.mlir.constant(32 : index) : i64
    %68 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb5(%66 : i64)
  ^bb5(%69: i64):  // 2 preds: ^bb4, ^bb6
    %70 = llvm.icmp "slt" %69, %67 : i64
    llvm.cond_br %70, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    %71 = llvm.trunc %69 : i64 to i32
    %72 = llvm.mul %54, %71  : i32
    %73 = llvm.srem %72, %6  : i32
    %74 = llvm.sitofp %73 : i32 to f32
    %75 = llvm.fdiv %74, %0  : f32
    %76 = llvm.add %71, %1  : i32
    %77 = llvm.mul %76, %65  : i32
    %78 = llvm.srem %77, %6  : i32
    %79 = llvm.sitofp %78 : i32 to f32
    %80 = llvm.fdiv %79, %0  : f32
    %81 = llvm.fmul %75, %80  : f32
    %82 = llvm.mlir.constant(32 : index) : i64
    %83 = llvm.mul %52, %82  : i64
    %84 = llvm.add %83, %58  : i64
    %85 = llvm.getelementptr %39[%84] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %86 = llvm.load %85 : !llvm.ptr -> f32
    %87 = llvm.fadd %86, %81  : f32
    %88 = llvm.mlir.constant(32 : index) : i64
    %89 = llvm.mul %52, %88  : i64
    %90 = llvm.add %89, %58  : i64
    %91 = llvm.getelementptr %39[%90] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %87, %91 : f32, !llvm.ptr
    %92 = llvm.add %69, %68  : i64
    llvm.br ^bb5(%92 : i64)
  ^bb7:  // pred: ^bb5
    %93 = llvm.add %58, %57  : i64
    llvm.br ^bb3(%93 : i64)
  ^bb8:  // pred: ^bb3
    %94 = llvm.add %52, %51  : i64
    llvm.br ^bb1(%94 : i64)
  ^bb9:  // pred: ^bb1
    %95 = llvm.mlir.constant(0 : index) : i64
    %96 = llvm.mlir.constant(32 : index) : i64
    %97 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb10(%95 : i64)
  ^bb10(%98: i64):  // 2 preds: ^bb9, ^bb17
    %99 = llvm.icmp "slt" %98, %96 : i64
    llvm.cond_br %99, ^bb11, ^bb18
  ^bb11:  // pred: ^bb10
    %100 = llvm.trunc %98 : i64 to i32
    %101 = llvm.mlir.constant(0 : index) : i64
    %102 = llvm.mlir.constant(32 : index) : i64
    %103 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb12(%101 : i64)
  ^bb12(%104: i64):  // 2 preds: ^bb11, ^bb16
    %105 = llvm.icmp "slt" %104, %102 : i64
    llvm.cond_br %105, ^bb13, ^bb17
  ^bb13:  // pred: ^bb12
    %106 = llvm.mlir.constant(32 : index) : i64
    %107 = llvm.mul %98, %106  : i64
    %108 = llvm.add %107, %104  : i64
    %109 = llvm.getelementptr %25[%108] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %5, %109 : f32, !llvm.ptr
    %110 = llvm.trunc %104 : i64 to i32
    %111 = llvm.add %110, %3  : i32
    %112 = llvm.mlir.constant(0 : index) : i64
    %113 = llvm.mlir.constant(32 : index) : i64
    %114 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb14(%112 : i64)
  ^bb14(%115: i64):  // 2 preds: ^bb13, ^bb15
    %116 = llvm.icmp "slt" %115, %113 : i64
    llvm.cond_br %116, ^bb15, ^bb16
  ^bb15:  // pred: ^bb14
    %117 = llvm.trunc %115 : i64 to i32
    %118 = llvm.add %117, %2  : i32
    %119 = llvm.mul %100, %118  : i32
    %120 = llvm.srem %119, %6  : i32
    %121 = llvm.sitofp %120 : i32 to f32
    %122 = llvm.fdiv %121, %0  : f32
    %123 = llvm.mul %117, %111  : i32
    %124 = llvm.srem %123, %6  : i32
    %125 = llvm.sitofp %124 : i32 to f32
    %126 = llvm.fdiv %125, %0  : f32
    %127 = llvm.fmul %122, %126  : f32
    %128 = llvm.mlir.constant(32 : index) : i64
    %129 = llvm.mul %98, %128  : i64
    %130 = llvm.add %129, %104  : i64
    %131 = llvm.getelementptr %25[%130] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %132 = llvm.load %131 : !llvm.ptr -> f32
    %133 = llvm.fadd %132, %127  : f32
    %134 = llvm.mlir.constant(32 : index) : i64
    %135 = llvm.mul %98, %134  : i64
    %136 = llvm.add %135, %104  : i64
    %137 = llvm.getelementptr %25[%136] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %133, %137 : f32, !llvm.ptr
    %138 = llvm.add %115, %114  : i64
    llvm.br ^bb14(%138 : i64)
  ^bb16:  // pred: ^bb14
    %139 = llvm.add %104, %103  : i64
    llvm.br ^bb12(%139 : i64)
  ^bb17:  // pred: ^bb12
    %140 = llvm.add %98, %97  : i64
    llvm.br ^bb10(%140 : i64)
  ^bb18:  // pred: ^bb10
    %141 = llvm.mlir.constant(0 : index) : i64
    %142 = llvm.mlir.constant(32 : index) : i64
    %143 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb19(%141 : i64)
  ^bb19(%144: i64):  // 2 preds: ^bb18, ^bb26
    %145 = llvm.icmp "slt" %144, %142 : i64
    llvm.cond_br %145, ^bb20, ^bb27
  ^bb20:  // pred: ^bb19
    %146 = llvm.mlir.constant(0 : index) : i64
    %147 = llvm.mlir.constant(32 : index) : i64
    %148 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb21(%146 : i64)
  ^bb21(%149: i64):  // 2 preds: ^bb20, ^bb25
    %150 = llvm.icmp "slt" %149, %147 : i64
    llvm.cond_br %150, ^bb22, ^bb26
  ^bb22:  // pred: ^bb21
    %151 = llvm.mlir.constant(32 : index) : i64
    %152 = llvm.mul %144, %151  : i64
    %153 = llvm.add %152, %149  : i64
    %154 = llvm.getelementptr %11[%153] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %5, %154 : f32, !llvm.ptr
    %155 = llvm.mlir.constant(0 : index) : i64
    %156 = llvm.mlir.constant(32 : index) : i64
    %157 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb23(%155 : i64)
  ^bb23(%158: i64):  // 2 preds: ^bb22, ^bb24
    %159 = llvm.icmp "slt" %158, %156 : i64
    llvm.cond_br %159, ^bb24, ^bb25
  ^bb24:  // pred: ^bb23
    %160 = llvm.mlir.constant(32 : index) : i64
    %161 = llvm.mul %144, %160  : i64
    %162 = llvm.add %161, %158  : i64
    %163 = llvm.getelementptr %39[%162] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %164 = llvm.load %163 : !llvm.ptr -> f32
    %165 = llvm.mlir.constant(32 : index) : i64
    %166 = llvm.mul %158, %165  : i64
    %167 = llvm.add %166, %149  : i64
    %168 = llvm.getelementptr %25[%167] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %169 = llvm.load %168 : !llvm.ptr -> f32
    %170 = llvm.fmul %164, %169  : f32
    %171 = llvm.mlir.constant(32 : index) : i64
    %172 = llvm.mul %144, %171  : i64
    %173 = llvm.add %172, %149  : i64
    %174 = llvm.getelementptr %11[%173] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %175 = llvm.load %174 : !llvm.ptr -> f32
    %176 = llvm.fadd %175, %170  : f32
    %177 = llvm.mlir.constant(32 : index) : i64
    %178 = llvm.mul %144, %177  : i64
    %179 = llvm.add %178, %149  : i64
    %180 = llvm.getelementptr %11[%179] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %176, %180 : f32, !llvm.ptr
    %181 = llvm.add %158, %157  : i64
    llvm.br ^bb23(%181 : i64)
  ^bb25:  // pred: ^bb23
    %182 = llvm.add %149, %148  : i64
    llvm.br ^bb21(%182 : i64)
  ^bb26:  // pred: ^bb21
    %183 = llvm.add %144, %143  : i64
    llvm.br ^bb19(%183 : i64)
  ^bb27:  // pred: ^bb19
    %184 = llvm.mlir.constant(0 : index) : i64
    %185 = llvm.mlir.constant(32 : index) : i64
    %186 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb28(%184, %5 : i64, f32)
  ^bb28(%187: i64, %188: f32):  // 2 preds: ^bb27, ^bb32
    %189 = llvm.icmp "slt" %187, %185 : i64
    llvm.cond_br %189, ^bb29, ^bb33
  ^bb29:  // pred: ^bb28
    %190 = llvm.mlir.constant(0 : index) : i64
    %191 = llvm.mlir.constant(32 : index) : i64
    %192 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb30(%190, %188 : i64, f32)
  ^bb30(%193: i64, %194: f32):  // 2 preds: ^bb29, ^bb31
    %195 = llvm.icmp "slt" %193, %191 : i64
    llvm.cond_br %195, ^bb31, ^bb32
  ^bb31:  // pred: ^bb30
    %196 = llvm.mlir.constant(32 : index) : i64
    %197 = llvm.mul %187, %196  : i64
    %198 = llvm.add %197, %193  : i64
    %199 = llvm.getelementptr %11[%198] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %200 = llvm.load %199 : !llvm.ptr -> f32
    %201 = llvm.fadd %194, %200  : f32
    %202 = llvm.add %193, %192  : i64
    llvm.br ^bb30(%202, %201 : i64, f32)
  ^bb32:  // pred: ^bb30
    %203 = llvm.add %187, %186  : i64
    llvm.br ^bb28(%203, %194 : i64, f32)
  ^bb33:  // pred: ^bb28
    %204 = llvm.fcmp "ogt" %188, %5 : f32
    %205 = llvm.xor %204, %4  : i1
    %206 = llvm.zext %205 : i1 to i32
    llvm.return %206 : i32
  }
}

