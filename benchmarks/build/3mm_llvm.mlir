module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i8, dense<[8, 32]> : vector<2xi32>>, #dlti.dl_entry<i16, dense<[16, 32]> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i128, dense<128> : vector<2xi32>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>>, llvm.data_layout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128", llvm.target_triple = "aarch64-unknown-linux-gnu", "polygeist.target-cpu" = "generic", "polygeist.target-features" = "+fp-armv8,+neon,+outline-atomics,+v8a,-fmv"} {
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
    %49 = llvm.mlir.constant(32 : index) : i64
    %50 = llvm.mlir.constant(32 : index) : i64
    %51 = llvm.mlir.constant(1 : index) : i64
    %52 = llvm.mlir.constant(1024 : index) : i64
    %53 = llvm.alloca %52 x f32 : (i64) -> !llvm.ptr
    %54 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %55 = llvm.insertvalue %53, %54[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %56 = llvm.insertvalue %53, %55[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %57 = llvm.mlir.constant(0 : index) : i64
    %58 = llvm.insertvalue %57, %56[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %59 = llvm.insertvalue %49, %58[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %60 = llvm.insertvalue %50, %59[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %61 = llvm.insertvalue %50, %60[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %62 = llvm.insertvalue %51, %61[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %63 = llvm.mlir.constant(32 : index) : i64
    %64 = llvm.mlir.constant(32 : index) : i64
    %65 = llvm.mlir.constant(1 : index) : i64
    %66 = llvm.mlir.constant(1024 : index) : i64
    %67 = llvm.alloca %66 x f32 : (i64) -> !llvm.ptr
    %68 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %69 = llvm.insertvalue %67, %68[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %70 = llvm.insertvalue %67, %69[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %71 = llvm.mlir.constant(0 : index) : i64
    %72 = llvm.insertvalue %71, %70[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %73 = llvm.insertvalue %63, %72[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %74 = llvm.insertvalue %64, %73[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %75 = llvm.insertvalue %64, %74[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %76 = llvm.insertvalue %65, %75[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %77 = llvm.mlir.constant(32 : index) : i64
    %78 = llvm.mlir.constant(32 : index) : i64
    %79 = llvm.mlir.constant(1 : index) : i64
    %80 = llvm.mlir.constant(1024 : index) : i64
    %81 = llvm.alloca %80 x f32 : (i64) -> !llvm.ptr
    %82 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %83 = llvm.insertvalue %81, %82[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %84 = llvm.insertvalue %81, %83[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %85 = llvm.mlir.constant(0 : index) : i64
    %86 = llvm.insertvalue %85, %84[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %87 = llvm.insertvalue %77, %86[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %88 = llvm.insertvalue %78, %87[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %89 = llvm.insertvalue %78, %88[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %90 = llvm.insertvalue %79, %89[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %91 = llvm.mlir.constant(32 : index) : i64
    %92 = llvm.mlir.constant(32 : index) : i64
    %93 = llvm.mlir.constant(1 : index) : i64
    %94 = llvm.mlir.constant(1024 : index) : i64
    %95 = llvm.alloca %94 x f32 : (i64) -> !llvm.ptr
    %96 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %97 = llvm.insertvalue %95, %96[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %98 = llvm.insertvalue %95, %97[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %99 = llvm.mlir.constant(0 : index) : i64
    %100 = llvm.insertvalue %99, %98[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %101 = llvm.insertvalue %91, %100[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %102 = llvm.insertvalue %92, %101[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %103 = llvm.insertvalue %92, %102[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %104 = llvm.insertvalue %93, %103[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %105 = llvm.mlir.constant(0 : index) : i64
    %106 = llvm.mlir.constant(32 : index) : i64
    %107 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%105 : i64)
  ^bb1(%108: i64):  // 2 preds: ^bb0, ^bb5
    %109 = llvm.icmp "slt" %108, %106 : i64
    llvm.cond_br %109, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    %110 = llvm.trunc %108 : i64 to i32
    %111 = llvm.mlir.constant(0 : index) : i64
    %112 = llvm.mlir.constant(32 : index) : i64
    %113 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb3(%111 : i64)
  ^bb3(%114: i64):  // 2 preds: ^bb2, ^bb4
    %115 = llvm.icmp "slt" %114, %112 : i64
    llvm.cond_br %115, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %116 = llvm.trunc %114 : i64 to i32
    %117 = llvm.mul %110, %116  : i32
    %118 = llvm.srem %117, %6  : i32
    %119 = llvm.sitofp %118 : i32 to f32
    %120 = llvm.fdiv %119, %0  : f32
    %121 = llvm.mlir.constant(32 : index) : i64
    %122 = llvm.mul %108, %121  : i64
    %123 = llvm.add %122, %114  : i64
    %124 = llvm.getelementptr %81[%123] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %120, %124 : f32, !llvm.ptr
    %125 = llvm.add %114, %113  : i64
    llvm.br ^bb3(%125 : i64)
  ^bb5:  // pred: ^bb3
    %126 = llvm.add %108, %107  : i64
    llvm.br ^bb1(%126 : i64)
  ^bb6:  // pred: ^bb1
    %127 = llvm.mlir.constant(0 : index) : i64
    %128 = llvm.mlir.constant(32 : index) : i64
    %129 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb7(%127 : i64)
  ^bb7(%130: i64):  // 2 preds: ^bb6, ^bb11
    %131 = llvm.icmp "slt" %130, %128 : i64
    llvm.cond_br %131, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    %132 = llvm.trunc %130 : i64 to i32
    %133 = llvm.add %132, %1  : i32
    %134 = llvm.mlir.constant(0 : index) : i64
    %135 = llvm.mlir.constant(32 : index) : i64
    %136 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb9(%134 : i64)
  ^bb9(%137: i64):  // 2 preds: ^bb8, ^bb10
    %138 = llvm.icmp "slt" %137, %135 : i64
    llvm.cond_br %138, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %139 = llvm.trunc %137 : i64 to i32
    %140 = llvm.add %139, %1  : i32
    %141 = llvm.mul %133, %140  : i32
    %142 = llvm.srem %141, %6  : i32
    %143 = llvm.sitofp %142 : i32 to f32
    %144 = llvm.fdiv %143, %0  : f32
    %145 = llvm.mlir.constant(32 : index) : i64
    %146 = llvm.mul %130, %145  : i64
    %147 = llvm.add %146, %137  : i64
    %148 = llvm.getelementptr %67[%147] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %144, %148 : f32, !llvm.ptr
    %149 = llvm.add %137, %136  : i64
    llvm.br ^bb9(%149 : i64)
  ^bb11:  // pred: ^bb9
    %150 = llvm.add %130, %129  : i64
    llvm.br ^bb7(%150 : i64)
  ^bb12:  // pred: ^bb7
    %151 = llvm.mlir.constant(0 : index) : i64
    %152 = llvm.mlir.constant(32 : index) : i64
    %153 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb13(%151 : i64)
  ^bb13(%154: i64):  // 2 preds: ^bb12, ^bb17
    %155 = llvm.icmp "slt" %154, %152 : i64
    llvm.cond_br %155, ^bb14, ^bb18
  ^bb14:  // pred: ^bb13
    %156 = llvm.trunc %154 : i64 to i32
    %157 = llvm.mlir.constant(0 : index) : i64
    %158 = llvm.mlir.constant(32 : index) : i64
    %159 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb15(%157 : i64)
  ^bb15(%160: i64):  // 2 preds: ^bb14, ^bb16
    %161 = llvm.icmp "slt" %160, %158 : i64
    llvm.cond_br %161, ^bb16, ^bb17
  ^bb16:  // pred: ^bb15
    %162 = llvm.trunc %160 : i64 to i32
    %163 = llvm.add %162, %2  : i32
    %164 = llvm.mul %156, %163  : i32
    %165 = llvm.srem %164, %6  : i32
    %166 = llvm.sitofp %165 : i32 to f32
    %167 = llvm.fdiv %166, %0  : f32
    %168 = llvm.mlir.constant(32 : index) : i64
    %169 = llvm.mul %154, %168  : i64
    %170 = llvm.add %169, %160  : i64
    %171 = llvm.getelementptr %39[%170] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %167, %171 : f32, !llvm.ptr
    %172 = llvm.add %160, %159  : i64
    llvm.br ^bb15(%172 : i64)
  ^bb17:  // pred: ^bb15
    %173 = llvm.add %154, %153  : i64
    llvm.br ^bb13(%173 : i64)
  ^bb18:  // pred: ^bb13
    %174 = llvm.mlir.constant(0 : index) : i64
    %175 = llvm.mlir.constant(32 : index) : i64
    %176 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb19(%174 : i64)
  ^bb19(%177: i64):  // 2 preds: ^bb18, ^bb23
    %178 = llvm.icmp "slt" %177, %175 : i64
    llvm.cond_br %178, ^bb20, ^bb24
  ^bb20:  // pred: ^bb19
    %179 = llvm.trunc %177 : i64 to i32
    %180 = llvm.mlir.constant(0 : index) : i64
    %181 = llvm.mlir.constant(32 : index) : i64
    %182 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb21(%180 : i64)
  ^bb21(%183: i64):  // 2 preds: ^bb20, ^bb22
    %184 = llvm.icmp "slt" %183, %181 : i64
    llvm.cond_br %184, ^bb22, ^bb23
  ^bb22:  // pred: ^bb21
    %185 = llvm.trunc %183 : i64 to i32
    %186 = llvm.add %185, %3  : i32
    %187 = llvm.mul %179, %186  : i32
    %188 = llvm.srem %187, %6  : i32
    %189 = llvm.sitofp %188 : i32 to f32
    %190 = llvm.fdiv %189, %0  : f32
    %191 = llvm.mlir.constant(32 : index) : i64
    %192 = llvm.mul %177, %191  : i64
    %193 = llvm.add %192, %183  : i64
    %194 = llvm.getelementptr %25[%193] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %190, %194 : f32, !llvm.ptr
    %195 = llvm.add %183, %182  : i64
    llvm.br ^bb21(%195 : i64)
  ^bb23:  // pred: ^bb21
    %196 = llvm.add %177, %176  : i64
    llvm.br ^bb19(%196 : i64)
  ^bb24:  // pred: ^bb19
    llvm.call @kernel_3mm(%6, %6, %6, %6, %6, %95, %95, %99, %91, %92, %92, %93, %81, %81, %85, %77, %78, %78, %79, %67, %67, %71, %63, %64, %64, %65, %53, %53, %57, %49, %50, %50, %51, %39, %39, %43, %35, %36, %36, %37, %25, %25, %29, %21, %22, %22, %23, %11, %11, %15, %7, %8, %8, %9) : (i32, i32, i32, i32, i32, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    %197 = llvm.mlir.constant(0 : index) : i64
    %198 = llvm.mlir.constant(32 : index) : i64
    %199 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb25(%197, %5 : i64, f32)
  ^bb25(%200: i64, %201: f32):  // 2 preds: ^bb24, ^bb29
    %202 = llvm.icmp "slt" %200, %198 : i64
    llvm.cond_br %202, ^bb26, ^bb30
  ^bb26:  // pred: ^bb25
    %203 = llvm.mlir.constant(0 : index) : i64
    %204 = llvm.mlir.constant(32 : index) : i64
    %205 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb27(%203, %201 : i64, f32)
  ^bb27(%206: i64, %207: f32):  // 2 preds: ^bb26, ^bb28
    %208 = llvm.icmp "slt" %206, %204 : i64
    llvm.cond_br %208, ^bb28, ^bb29
  ^bb28:  // pred: ^bb27
    %209 = llvm.mlir.constant(32 : index) : i64
    %210 = llvm.mul %200, %209  : i64
    %211 = llvm.add %210, %206  : i64
    %212 = llvm.getelementptr %11[%211] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %213 = llvm.load %212 : !llvm.ptr -> f32
    %214 = llvm.fadd %207, %213  : f32
    %215 = llvm.add %206, %205  : i64
    llvm.br ^bb27(%215, %214 : i64, f32)
  ^bb29:  // pred: ^bb27
    %216 = llvm.add %200, %199  : i64
    llvm.br ^bb25(%216, %207 : i64, f32)
  ^bb30:  // pred: ^bb25
    %217 = llvm.fcmp "ogt" %201, %5 : f32
    %218 = llvm.xor %217, %4  : i1
    %219 = llvm.zext %218 : i1 to i32
    llvm.return %219 : i32
  }
  llvm.func internal @kernel_3mm(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: !llvm.ptr, %arg13: !llvm.ptr, %arg14: i64, %arg15: i64, %arg16: i64, %arg17: i64, %arg18: i64, %arg19: !llvm.ptr, %arg20: !llvm.ptr, %arg21: i64, %arg22: i64, %arg23: i64, %arg24: i64, %arg25: i64, %arg26: !llvm.ptr, %arg27: !llvm.ptr, %arg28: i64, %arg29: i64, %arg30: i64, %arg31: i64, %arg32: i64, %arg33: !llvm.ptr, %arg34: !llvm.ptr, %arg35: i64, %arg36: i64, %arg37: i64, %arg38: i64, %arg39: i64, %arg40: !llvm.ptr, %arg41: !llvm.ptr, %arg42: i64, %arg43: i64, %arg44: i64, %arg45: i64, %arg46: i64, %arg47: !llvm.ptr, %arg48: !llvm.ptr, %arg49: i64, %arg50: i64, %arg51: i64, %arg52: i64, %arg53: i64) attributes {sym_visibility = "private"} {
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
    %24 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %25 = llvm.insertvalue %arg26, %24[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.insertvalue %arg27, %25[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.insertvalue %arg28, %26[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.insertvalue %arg29, %27[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.insertvalue %arg31, %28[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %arg30, %29[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.insertvalue %arg32, %30[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %33 = llvm.insertvalue %arg33, %32[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %arg34, %33[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %arg35, %34[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %arg36, %35[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.insertvalue %arg38, %36[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %38 = llvm.insertvalue %arg37, %37[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.insertvalue %arg39, %38[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %40 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %41 = llvm.insertvalue %arg40, %40[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %42 = llvm.insertvalue %arg41, %41[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %43 = llvm.insertvalue %arg42, %42[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %44 = llvm.insertvalue %arg43, %43[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %45 = llvm.insertvalue %arg45, %44[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %46 = llvm.insertvalue %arg44, %45[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.insertvalue %arg46, %46[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %49 = llvm.insertvalue %arg47, %48[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.insertvalue %arg48, %49[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %arg49, %50[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.insertvalue %arg50, %51[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %53 = llvm.insertvalue %arg52, %52[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.insertvalue %arg51, %53[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %55 = llvm.insertvalue %arg53, %54[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %56 = llvm.mlir.constant(0 : index) : i64
    %57 = llvm.mlir.constant(1 : index) : i64
    %58 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %59 = llvm.sext %arg2 : i32 to i64
    %60 = llvm.sext %arg4 : i32 to i64
    %61 = llvm.sext %arg3 : i32 to i64
    %62 = llvm.sext %arg1 : i32 to i64
    omp.parallel   {
      %63 = llvm.sext %arg0 : i32 to i64
      omp.wsloop   for  (%arg54) : i64 = (%56) to (%63) step (%57) {
        %64 = llvm.mlir.constant(0 : index) : i64
        %65 = llvm.mlir.constant(1 : index) : i64
        llvm.br ^bb1(%64 : i64)
      ^bb1(%66: i64):  // 2 preds: ^bb0, ^bb5
        %67 = llvm.icmp "slt" %66, %62 : i64
        llvm.cond_br %67, ^bb2, ^bb6
      ^bb2:  // pred: ^bb1
        %68 = llvm.mlir.constant(32 : index) : i64
        %69 = llvm.mul %arg54, %68  : i64
        %70 = llvm.add %69, %66  : i64
        %71 = llvm.getelementptr %arg6[%70] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %58, %71 : f32, !llvm.ptr
        %72 = llvm.mlir.constant(0 : index) : i64
        %73 = llvm.mlir.constant(1 : index) : i64
        llvm.br ^bb3(%72 : i64)
      ^bb3(%74: i64):  // 2 preds: ^bb2, ^bb4
        %75 = llvm.icmp "slt" %74, %59 : i64
        llvm.cond_br %75, ^bb4, ^bb5
      ^bb4:  // pred: ^bb3
        %76 = llvm.mlir.constant(32 : index) : i64
        %77 = llvm.mul %arg54, %76  : i64
        %78 = llvm.add %77, %74  : i64
        %79 = llvm.getelementptr %arg13[%78] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %80 = llvm.load %79 : !llvm.ptr -> f32
        %81 = llvm.mlir.constant(32 : index) : i64
        %82 = llvm.mul %74, %81  : i64
        %83 = llvm.add %82, %66  : i64
        %84 = llvm.getelementptr %arg20[%83] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %85 = llvm.load %84 : !llvm.ptr -> f32
        %86 = llvm.fmul %80, %85  : f32
        %87 = llvm.mlir.constant(32 : index) : i64
        %88 = llvm.mul %arg54, %87  : i64
        %89 = llvm.add %88, %66  : i64
        %90 = llvm.getelementptr %arg6[%89] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %91 = llvm.load %90 : !llvm.ptr -> f32
        %92 = llvm.fadd %91, %86  : f32
        %93 = llvm.mlir.constant(32 : index) : i64
        %94 = llvm.mul %arg54, %93  : i64
        %95 = llvm.add %94, %66  : i64
        %96 = llvm.getelementptr %arg6[%95] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %92, %96 : f32, !llvm.ptr
        %97 = llvm.add %74, %73  : i64
        llvm.br ^bb3(%97 : i64)
      ^bb5:  // pred: ^bb3
        %98 = llvm.add %66, %65  : i64
        llvm.br ^bb1(%98 : i64)
      ^bb6:  // pred: ^bb1
        omp.yield
      }
      omp.terminator
    }
    omp.parallel   {
      omp.wsloop   for  (%arg54) : i64 = (%56) to (%62) step (%57) {
        %63 = llvm.mlir.constant(0 : index) : i64
        %64 = llvm.mlir.constant(1 : index) : i64
        llvm.br ^bb1(%63 : i64)
      ^bb1(%65: i64):  // 2 preds: ^bb0, ^bb5
        %66 = llvm.icmp "slt" %65, %61 : i64
        llvm.cond_br %66, ^bb2, ^bb6
      ^bb2:  // pred: ^bb1
        %67 = llvm.mlir.constant(32 : index) : i64
        %68 = llvm.mul %arg54, %67  : i64
        %69 = llvm.add %68, %65  : i64
        %70 = llvm.getelementptr %arg27[%69] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %58, %70 : f32, !llvm.ptr
        %71 = llvm.mlir.constant(0 : index) : i64
        %72 = llvm.mlir.constant(1 : index) : i64
        llvm.br ^bb3(%71 : i64)
      ^bb3(%73: i64):  // 2 preds: ^bb2, ^bb4
        %74 = llvm.icmp "slt" %73, %60 : i64
        llvm.cond_br %74, ^bb4, ^bb5
      ^bb4:  // pred: ^bb3
        %75 = llvm.mlir.constant(32 : index) : i64
        %76 = llvm.mul %arg54, %75  : i64
        %77 = llvm.add %76, %73  : i64
        %78 = llvm.getelementptr %arg34[%77] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %79 = llvm.load %78 : !llvm.ptr -> f32
        %80 = llvm.mlir.constant(32 : index) : i64
        %81 = llvm.mul %73, %80  : i64
        %82 = llvm.add %81, %65  : i64
        %83 = llvm.getelementptr %arg41[%82] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %84 = llvm.load %83 : !llvm.ptr -> f32
        %85 = llvm.fmul %79, %84  : f32
        %86 = llvm.mlir.constant(32 : index) : i64
        %87 = llvm.mul %arg54, %86  : i64
        %88 = llvm.add %87, %65  : i64
        %89 = llvm.getelementptr %arg27[%88] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %90 = llvm.load %89 : !llvm.ptr -> f32
        %91 = llvm.fadd %90, %85  : f32
        %92 = llvm.mlir.constant(32 : index) : i64
        %93 = llvm.mul %arg54, %92  : i64
        %94 = llvm.add %93, %65  : i64
        %95 = llvm.getelementptr %arg27[%94] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %91, %95 : f32, !llvm.ptr
        %96 = llvm.add %73, %72  : i64
        llvm.br ^bb3(%96 : i64)
      ^bb5:  // pred: ^bb3
        %97 = llvm.add %65, %64  : i64
        llvm.br ^bb1(%97 : i64)
      ^bb6:  // pred: ^bb1
        omp.yield
      }
      omp.terminator
    }
    omp.parallel   {
      %63 = llvm.sext %arg0 : i32 to i64
      omp.wsloop   for  (%arg54) : i64 = (%56) to (%63) step (%57) {
        %64 = llvm.mlir.constant(0 : index) : i64
        %65 = llvm.mlir.constant(1 : index) : i64
        llvm.br ^bb1(%64 : i64)
      ^bb1(%66: i64):  // 2 preds: ^bb0, ^bb5
        %67 = llvm.icmp "slt" %66, %61 : i64
        llvm.cond_br %67, ^bb2, ^bb6
      ^bb2:  // pred: ^bb1
        %68 = llvm.mlir.constant(32 : index) : i64
        %69 = llvm.mul %arg54, %68  : i64
        %70 = llvm.add %69, %66  : i64
        %71 = llvm.getelementptr %arg48[%70] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %58, %71 : f32, !llvm.ptr
        %72 = llvm.mlir.constant(0 : index) : i64
        %73 = llvm.mlir.constant(1 : index) : i64
        llvm.br ^bb3(%72 : i64)
      ^bb3(%74: i64):  // 2 preds: ^bb2, ^bb4
        %75 = llvm.icmp "slt" %74, %62 : i64
        llvm.cond_br %75, ^bb4, ^bb5
      ^bb4:  // pred: ^bb3
        %76 = llvm.mlir.constant(32 : index) : i64
        %77 = llvm.mul %arg54, %76  : i64
        %78 = llvm.add %77, %74  : i64
        %79 = llvm.getelementptr %arg6[%78] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %80 = llvm.load %79 : !llvm.ptr -> f32
        %81 = llvm.mlir.constant(32 : index) : i64
        %82 = llvm.mul %74, %81  : i64
        %83 = llvm.add %82, %66  : i64
        %84 = llvm.getelementptr %arg27[%83] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %85 = llvm.load %84 : !llvm.ptr -> f32
        %86 = llvm.fmul %80, %85  : f32
        %87 = llvm.mlir.constant(32 : index) : i64
        %88 = llvm.mul %arg54, %87  : i64
        %89 = llvm.add %88, %66  : i64
        %90 = llvm.getelementptr %arg48[%89] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %91 = llvm.load %90 : !llvm.ptr -> f32
        %92 = llvm.fadd %91, %86  : f32
        %93 = llvm.mlir.constant(32 : index) : i64
        %94 = llvm.mul %arg54, %93  : i64
        %95 = llvm.add %94, %66  : i64
        %96 = llvm.getelementptr %arg48[%95] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        llvm.store %92, %96 : f32, !llvm.ptr
        %97 = llvm.add %74, %73  : i64
        llvm.br ^bb3(%97 : i64)
      ^bb5:  // pred: ^bb3
        %98 = llvm.add %66, %65  : i64
        llvm.br ^bb1(%98 : i64)
      ^bb6:  // pred: ^bb1
        omp.yield
      }
      omp.terminator
    }
    llvm.return
  }
}

