; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-elf"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, ptr @0 }, align 8

declare ptr @malloc(i64)

declare void @free(ptr)

define i32 @main() {
  %1 = alloca float, i64 1024, align 4
  %2 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %1, 0
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %2, ptr %1, 1
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, i64 0, 2
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 32, 3, 0
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 32, 3, 1
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 32, 4, 0
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 1, 4, 1
  %9 = alloca float, i64 1024, align 4
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %9, 0
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, ptr %9, 1
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, i64 0, 2
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 32, 3, 0
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 32, 3, 1
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 32, 4, 0
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 1, 4, 1
  %17 = alloca float, i64 1024, align 4
  %18 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %17, 0
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %18, ptr %17, 1
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, i64 0, 2
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 32, 3, 0
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 32, 3, 1
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 32, 4, 0
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 1, 4, 1
  %25 = alloca float, i64 1024, align 4
  %26 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %25, 0
  %27 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %26, ptr %25, 1
  %28 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %27, i64 0, 2
  %29 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %28, i64 32, 3, 0
  %30 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, i64 32, 3, 1
  %31 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %30, i64 32, 4, 0
  %32 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %31, i64 1, 4, 1
  %33 = alloca float, i64 1024, align 4
  %34 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %33, 0
  %35 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %34, ptr %33, 1
  %36 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %35, i64 0, 2
  %37 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %36, i64 32, 3, 0
  %38 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %37, i64 32, 3, 1
  %39 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %38, i64 32, 4, 0
  %40 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %39, i64 1, 4, 1
  %41 = alloca float, i64 1024, align 4
  %42 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %41, 0
  %43 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %42, ptr %41, 1
  %44 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %43, i64 0, 2
  %45 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %44, i64 32, 3, 0
  %46 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %45, i64 32, 3, 1
  %47 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %46, i64 32, 4, 0
  %48 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %47, i64 1, 4, 1
  %49 = alloca float, i64 1024, align 4
  %50 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %49, 0
  %51 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %50, ptr %49, 1
  %52 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %51, i64 0, 2
  %53 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %52, i64 32, 3, 0
  %54 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %53, i64 32, 3, 1
  %55 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %54, i64 32, 4, 0
  %56 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %55, i64 1, 4, 1
  br label %57

57:                                               ; preds = %75, %0
  %58 = phi i64 [ %76, %75 ], [ 0, %0 ]
  %59 = icmp slt i64 %58, 32
  br i1 %59, label %60, label %77

60:                                               ; preds = %57
  %61 = trunc i64 %58 to i32
  br label %62

62:                                               ; preds = %65, %60
  %63 = phi i64 [ %74, %65 ], [ 0, %60 ]
  %64 = icmp slt i64 %63, 32
  br i1 %64, label %65, label %75

65:                                               ; preds = %62
  %66 = trunc i64 %63 to i32
  %67 = mul i32 %61, %66
  %68 = srem i32 %67, 32
  %69 = sitofp i32 %68 to float
  %70 = fdiv float %69, 1.600000e+02
  %71 = mul i64 %58, 32
  %72 = add i64 %71, %63
  %73 = getelementptr float, ptr %41, i64 %72
  store float %70, ptr %73, align 4
  %74 = add i64 %63, 1
  br label %62

75:                                               ; preds = %62
  %76 = add i64 %58, 1
  br label %57

77:                                               ; preds = %57
  br label %78

78:                                               ; preds = %98, %77
  %79 = phi i64 [ %99, %98 ], [ 0, %77 ]
  %80 = icmp slt i64 %79, 32
  br i1 %80, label %81, label %100

81:                                               ; preds = %78
  %82 = trunc i64 %79 to i32
  %83 = add i32 %82, 1
  br label %84

84:                                               ; preds = %87, %81
  %85 = phi i64 [ %97, %87 ], [ 0, %81 ]
  %86 = icmp slt i64 %85, 32
  br i1 %86, label %87, label %98

87:                                               ; preds = %84
  %88 = trunc i64 %85 to i32
  %89 = add i32 %88, 1
  %90 = mul i32 %83, %89
  %91 = srem i32 %90, 32
  %92 = sitofp i32 %91 to float
  %93 = fdiv float %92, 1.600000e+02
  %94 = mul i64 %79, 32
  %95 = add i64 %94, %85
  %96 = getelementptr float, ptr %33, i64 %95
  store float %93, ptr %96, align 4
  %97 = add i64 %85, 1
  br label %84

98:                                               ; preds = %84
  %99 = add i64 %79, 1
  br label %78

100:                                              ; preds = %78
  br label %101

101:                                              ; preds = %120, %100
  %102 = phi i64 [ %121, %120 ], [ 0, %100 ]
  %103 = icmp slt i64 %102, 32
  br i1 %103, label %104, label %122

104:                                              ; preds = %101
  %105 = trunc i64 %102 to i32
  br label %106

106:                                              ; preds = %109, %104
  %107 = phi i64 [ %119, %109 ], [ 0, %104 ]
  %108 = icmp slt i64 %107, 32
  br i1 %108, label %109, label %120

109:                                              ; preds = %106
  %110 = trunc i64 %107 to i32
  %111 = add i32 %110, 3
  %112 = mul i32 %105, %111
  %113 = srem i32 %112, 32
  %114 = sitofp i32 %113 to float
  %115 = fdiv float %114, 1.600000e+02
  %116 = mul i64 %102, 32
  %117 = add i64 %116, %107
  %118 = getelementptr float, ptr %17, i64 %117
  store float %115, ptr %118, align 4
  %119 = add i64 %107, 1
  br label %106

120:                                              ; preds = %106
  %121 = add i64 %102, 1
  br label %101

122:                                              ; preds = %101
  br label %123

123:                                              ; preds = %142, %122
  %124 = phi i64 [ %143, %142 ], [ 0, %122 ]
  %125 = icmp slt i64 %124, 32
  br i1 %125, label %126, label %144

126:                                              ; preds = %123
  %127 = trunc i64 %124 to i32
  br label %128

128:                                              ; preds = %131, %126
  %129 = phi i64 [ %141, %131 ], [ 0, %126 ]
  %130 = icmp slt i64 %129, 32
  br i1 %130, label %131, label %142

131:                                              ; preds = %128
  %132 = trunc i64 %129 to i32
  %133 = add i32 %132, 2
  %134 = mul i32 %127, %133
  %135 = srem i32 %134, 32
  %136 = sitofp i32 %135 to float
  %137 = fdiv float %136, 1.600000e+02
  %138 = mul i64 %124, 32
  %139 = add i64 %138, %129
  %140 = getelementptr float, ptr %9, i64 %139
  store float %137, ptr %140, align 4
  %141 = add i64 %129, 1
  br label %128

142:                                              ; preds = %128
  %143 = add i64 %124, 1
  br label %123

144:                                              ; preds = %123
  call void @kernel_3mm(i32 32, i32 32, i32 32, i32 32, i32 32, ptr %49, ptr %49, i64 0, i64 32, i64 32, i64 32, i64 1, ptr %41, ptr %41, i64 0, i64 32, i64 32, i64 32, i64 1, ptr %33, ptr %33, i64 0, i64 32, i64 32, i64 32, i64 1, ptr %25, ptr %25, i64 0, i64 32, i64 32, i64 32, i64 1, ptr %17, ptr %17, i64 0, i64 32, i64 32, i64 32, i64 1, ptr %9, ptr %9, i64 0, i64 32, i64 32, i64 32, i64 1, ptr %1, ptr %1, i64 0, i64 32, i64 32, i64 32, i64 1)
  br label %145

145:                                              ; preds = %161, %144
  %146 = phi i64 [ %162, %161 ], [ 0, %144 ]
  %147 = phi float [ %152, %161 ], [ 0.000000e+00, %144 ]
  %148 = icmp slt i64 %146, 32
  br i1 %148, label %149, label %163

149:                                              ; preds = %145
  br label %150

150:                                              ; preds = %154, %149
  %151 = phi i64 [ %160, %154 ], [ 0, %149 ]
  %152 = phi float [ %159, %154 ], [ %147, %149 ]
  %153 = icmp slt i64 %151, 32
  br i1 %153, label %154, label %161

154:                                              ; preds = %150
  %155 = mul i64 %146, 32
  %156 = add i64 %155, %151
  %157 = getelementptr float, ptr %1, i64 %156
  %158 = load float, ptr %157, align 4
  %159 = fadd float %152, %158
  %160 = add i64 %151, 1
  br label %150

161:                                              ; preds = %150
  %162 = add i64 %146, 1
  br label %145

163:                                              ; preds = %145
  %164 = fcmp ogt float %147, 0.000000e+00
  %165 = xor i1 %164, true
  %166 = zext i1 %165 to i32
  ret i32 %166
}

define internal void @kernel_3mm(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, ptr %5, ptr %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, ptr %12, ptr %13, i64 %14, i64 %15, i64 %16, i64 %17, i64 %18, ptr %19, ptr %20, i64 %21, i64 %22, i64 %23, i64 %24, i64 %25, ptr %26, ptr %27, i64 %28, i64 %29, i64 %30, i64 %31, i64 %32, ptr %33, ptr %34, i64 %35, i64 %36, i64 %37, i64 %38, i64 %39, ptr %40, ptr %41, i64 %42, i64 %43, i64 %44, i64 %45, i64 %46, ptr %47, ptr %48, i64 %49, i64 %50, i64 %51, i64 %52, i64 %53) {
  %structArg104 = alloca { ptr, ptr, ptr, ptr, ptr, ptr }, align 8
  %structArg99 = alloca { ptr, ptr, ptr, ptr, ptr, ptr }, align 8
  %structArg = alloca { ptr, ptr, ptr, ptr, ptr, ptr }, align 8
  %.reloaded94 = alloca i32, align 4
  %.reloaded95 = alloca i64, align 8
  %.reloaded96 = alloca i64, align 8
  %.reloaded52 = alloca i64, align 8
  %.reloaded53 = alloca i64, align 8
  %.reloaded54 = alloca i64, align 8
  %.reloaded = alloca i32, align 4
  %.reloaded11 = alloca i64, align 8
  %.reloaded12 = alloca i64, align 8
  %55 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %5, 0
  %56 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %55, ptr %6, 1
  %57 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %56, i64 %7, 2
  %58 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %57, i64 %8, 3, 0
  %59 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %58, i64 %10, 4, 0
  %60 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %59, i64 %9, 3, 1
  %61 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %60, i64 %11, 4, 1
  %62 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %12, 0
  %63 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %62, ptr %13, 1
  %64 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %63, i64 %14, 2
  %65 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %64, i64 %15, 3, 0
  %66 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %65, i64 %17, 4, 0
  %67 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %66, i64 %16, 3, 1
  %68 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %67, i64 %18, 4, 1
  %69 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %19, 0
  %70 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %69, ptr %20, 1
  %71 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %70, i64 %21, 2
  %72 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %71, i64 %22, 3, 0
  %73 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %72, i64 %24, 4, 0
  %74 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %73, i64 %23, 3, 1
  %75 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %74, i64 %25, 4, 1
  %76 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %26, 0
  %77 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %76, ptr %27, 1
  %78 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %77, i64 %28, 2
  %79 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %78, i64 %29, 3, 0
  %80 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %79, i64 %31, 4, 0
  %81 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %80, i64 %30, 3, 1
  %82 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %81, i64 %32, 4, 1
  %83 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %33, 0
  %84 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %83, ptr %34, 1
  %85 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %84, i64 %35, 2
  %86 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %85, i64 %36, 3, 0
  %87 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %86, i64 %38, 4, 0
  %88 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %87, i64 %37, 3, 1
  %89 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %88, i64 %39, 4, 1
  %90 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %40, 0
  %91 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %90, ptr %41, 1
  %92 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %91, i64 %42, 2
  %93 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %92, i64 %43, 3, 0
  %94 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %93, i64 %45, 4, 0
  %95 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %94, i64 %44, 3, 1
  %96 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %95, i64 %46, 4, 1
  %97 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %47, 0
  %98 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %97, ptr %48, 1
  %99 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %98, i64 %49, 2
  %100 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %99, i64 %50, 3, 0
  %101 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %100, i64 %52, 4, 0
  %102 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %101, i64 %51, 3, 1
  %103 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %102, i64 %53, 4, 1
  %104 = sext i32 %2 to i64
  %105 = sext i32 %4 to i64
  %106 = sext i32 %3 to i64
  %107 = sext i32 %1 to i64
  br label %entry

entry:                                            ; preds = %54
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  store i32 %0, ptr %.reloaded, align 4
  store i64 %107, ptr %.reloaded11, align 8
  store i64 %104, ptr %.reloaded12, align 8
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %gep_.reloaded = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 0
  store ptr %.reloaded, ptr %gep_.reloaded, align 8
  %gep_.reloaded11 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 1
  store ptr %.reloaded11, ptr %gep_.reloaded11, align 8
  %gep_.reloaded12 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 2
  store ptr %.reloaded12, ptr %gep_.reloaded12, align 8
  %gep_ = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 3
  store ptr %6, ptr %gep_, align 8
  %gep_97 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 4
  store ptr %13, ptr %gep_97, align 8
  %gep_98 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 5
  store ptr %20, ptr %gep_98, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @kernel_3mm..omp_par, ptr %structArg)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  %omp_global_thread_num13 = call i32 @__kmpc_global_thread_num(ptr @1)
  store i64 %107, ptr %.reloaded52, align 8
  store i64 %106, ptr %.reloaded53, align 8
  store i64 %105, ptr %.reloaded54, align 8
  br label %omp_parallel103

omp_parallel103:                                  ; preds = %omp.par.exit.split
  %gep_.reloaded52 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg99, i32 0, i32 0
  store ptr %.reloaded52, ptr %gep_.reloaded52, align 8
  %gep_.reloaded53 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg99, i32 0, i32 1
  store ptr %.reloaded53, ptr %gep_.reloaded53, align 8
  %gep_.reloaded54 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg99, i32 0, i32 2
  store ptr %.reloaded54, ptr %gep_.reloaded54, align 8
  %gep_100 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg99, i32 0, i32 3
  store ptr %27, ptr %gep_100, align 8
  %gep_101 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg99, i32 0, i32 4
  store ptr %34, ptr %gep_101, align 8
  %gep_102 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg99, i32 0, i32 5
  store ptr %41, ptr %gep_102, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @kernel_3mm..omp_par.1, ptr %structArg99)
  br label %omp.par.outlined.exit51

omp.par.outlined.exit51:                          ; preds = %omp_parallel103
  br label %omp.par.exit.split50

omp.par.exit.split50:                             ; preds = %omp.par.outlined.exit51
  %omp_global_thread_num55 = call i32 @__kmpc_global_thread_num(ptr @1)
  store i32 %0, ptr %.reloaded94, align 4
  store i64 %106, ptr %.reloaded95, align 8
  store i64 %107, ptr %.reloaded96, align 8
  br label %omp_parallel108

omp_parallel108:                                  ; preds = %omp.par.exit.split50
  %gep_.reloaded94 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg104, i32 0, i32 0
  store ptr %.reloaded94, ptr %gep_.reloaded94, align 8
  %gep_.reloaded95 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg104, i32 0, i32 1
  store ptr %.reloaded95, ptr %gep_.reloaded95, align 8
  %gep_.reloaded96 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg104, i32 0, i32 2
  store ptr %.reloaded96, ptr %gep_.reloaded96, align 8
  %gep_105 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg104, i32 0, i32 3
  store ptr %48, ptr %gep_105, align 8
  %gep_106 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg104, i32 0, i32 4
  store ptr %6, ptr %gep_106, align 8
  %gep_107 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg104, i32 0, i32 5
  store ptr %27, ptr %gep_107, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @kernel_3mm..omp_par.2, ptr %structArg104)
  br label %omp.par.outlined.exit93

omp.par.outlined.exit93:                          ; preds = %omp_parallel108
  br label %omp.par.exit.split92

omp.par.exit.split92:                             ; preds = %omp.par.outlined.exit93
  ret void
}

; Function Attrs: norecurse nounwind
define internal void @kernel_3mm..omp_par.2(ptr noalias %tid.addr56, ptr noalias %zero.addr57, ptr %0) #0 {
omp.par.entry58:
  %gep_.reloaded94 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_.reloaded94 = load ptr, ptr %gep_.reloaded94, align 8
  %gep_.reloaded95 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_.reloaded95 = load ptr, ptr %gep_.reloaded95, align 8
  %gep_.reloaded96 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 2
  %loadgep_.reloaded96 = load ptr, ptr %gep_.reloaded96, align 8
  %gep_ = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 3
  %loadgep_ = load ptr, ptr %gep_, align 8
  %gep_1 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 4
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  %gep_3 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 5
  %loadgep_4 = load ptr, ptr %gep_3, align 8
  %tid.addr.local61 = alloca i32, align 4
  %1 = load i32, ptr %tid.addr56, align 4
  store i32 %1, ptr %tid.addr.local61, align 4
  %tid62 = load i32, ptr %tid.addr.local61, align 4
  %2 = load i32, ptr %loadgep_.reloaded94, align 4
  %3 = load i64, ptr %loadgep_.reloaded95, align 8
  %4 = load i64, ptr %loadgep_.reloaded96, align 8
  %p.lastiter86 = alloca i32, align 4
  %p.lowerbound87 = alloca i64, align 8
  %p.upperbound88 = alloca i64, align 8
  %p.stride89 = alloca i64, align 8
  br label %omp.par.region59

omp.par.region59:                                 ; preds = %omp.par.entry58
  br label %omp.par.region66

omp.par.region66:                                 ; preds = %omp.par.region59
  %5 = sext i32 %2 to i64
  %6 = select i1 false, i64 %5, i64 0
  %7 = select i1 false, i64 0, i64 %5
  %8 = sub nsw i64 %7, %6
  %9 = icmp sle i64 %7, %6
  %10 = sub i64 %8, 1
  %11 = udiv i64 %10, 1
  %12 = add i64 %11, 1
  %13 = icmp ule i64 %8, 1
  %14 = select i1 %13, i64 1, i64 %12
  %omp_loop.tripcount67 = select i1 %9, i64 0, i64 %14
  br label %omp_loop.preheader68

omp_loop.preheader68:                             ; preds = %omp.par.region66
  store i64 0, ptr %p.lowerbound87, align 8
  %15 = sub i64 %omp_loop.tripcount67, 1
  store i64 %15, ptr %p.upperbound88, align 8
  store i64 1, ptr %p.stride89, align 8
  %omp_global_thread_num90 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_8u(ptr @1, i32 %omp_global_thread_num90, i32 34, ptr %p.lastiter86, ptr %p.lowerbound87, ptr %p.upperbound88, ptr %p.stride89, i64 1, i64 0)
  %16 = load i64, ptr %p.lowerbound87, align 8
  %17 = load i64, ptr %p.upperbound88, align 8
  %18 = sub i64 %17, %16
  %19 = add i64 %18, 1
  br label %omp_loop.header69

omp_loop.header69:                                ; preds = %omp_loop.inc72, %omp_loop.preheader68
  %omp_loop.iv75 = phi i64 [ 0, %omp_loop.preheader68 ], [ %omp_loop.next77, %omp_loop.inc72 ]
  br label %omp_loop.cond70

omp_loop.cond70:                                  ; preds = %omp_loop.header69
  %omp_loop.cmp76 = icmp ult i64 %omp_loop.iv75, %19
  br i1 %omp_loop.cmp76, label %omp_loop.body71, label %omp_loop.exit73

omp_loop.exit73:                                  ; preds = %omp_loop.cond70
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num90)
  %omp_global_thread_num91 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num91)
  br label %omp_loop.after74

omp_loop.after74:                                 ; preds = %omp_loop.exit73
  br label %omp.region.cont65

omp.region.cont65:                                ; preds = %omp_loop.after74
  br label %omp.par.pre_finalize60

omp.par.pre_finalize60:                           ; preds = %omp.region.cont65
  br label %omp.par.outlined.exit93.exitStub

omp_loop.body71:                                  ; preds = %omp_loop.cond70
  %20 = add i64 %omp_loop.iv75, %16
  %21 = mul i64 %20, 1
  %22 = add i64 %21, 0
  br label %omp.wsloop.region79

omp.wsloop.region79:                              ; preds = %omp_loop.body71
  br label %omp.wsloop.region80

omp.wsloop.region80:                              ; preds = %omp.wsloop.region84, %omp.wsloop.region79
  %23 = phi i64 [ %30, %omp.wsloop.region84 ], [ 0, %omp.wsloop.region79 ]
  %24 = icmp slt i64 %23, %3
  br i1 %24, label %omp.wsloop.region81, label %omp.wsloop.region85

omp.wsloop.region85:                              ; preds = %omp.wsloop.region80
  br label %omp.region.cont78

omp.region.cont78:                                ; preds = %omp.wsloop.region85
  br label %omp_loop.inc72

omp_loop.inc72:                                   ; preds = %omp.region.cont78
  %omp_loop.next77 = add nuw i64 %omp_loop.iv75, 1
  br label %omp_loop.header69

omp.wsloop.region81:                              ; preds = %omp.wsloop.region80
  %25 = mul i64 %22, 32
  %26 = add i64 %25, %23
  %27 = getelementptr float, ptr %loadgep_, i64 %26
  store float 0.000000e+00, ptr %27, align 4
  br label %omp.wsloop.region82

omp.wsloop.region82:                              ; preds = %omp.wsloop.region83, %omp.wsloop.region81
  %28 = phi i64 [ %48, %omp.wsloop.region83 ], [ 0, %omp.wsloop.region81 ]
  %29 = icmp slt i64 %28, %4
  br i1 %29, label %omp.wsloop.region83, label %omp.wsloop.region84

omp.wsloop.region84:                              ; preds = %omp.wsloop.region82
  %30 = add i64 %23, 1
  br label %omp.wsloop.region80

omp.wsloop.region83:                              ; preds = %omp.wsloop.region82
  %31 = mul i64 %22, 32
  %32 = add i64 %31, %28
  %33 = getelementptr float, ptr %loadgep_2, i64 %32
  %34 = load float, ptr %33, align 4
  %35 = mul i64 %28, 32
  %36 = add i64 %35, %23
  %37 = getelementptr float, ptr %loadgep_4, i64 %36
  %38 = load float, ptr %37, align 4
  %39 = fmul float %34, %38
  %40 = mul i64 %22, 32
  %41 = add i64 %40, %23
  %42 = getelementptr float, ptr %loadgep_, i64 %41
  %43 = load float, ptr %42, align 4
  %44 = fadd float %43, %39
  %45 = mul i64 %22, 32
  %46 = add i64 %45, %23
  %47 = getelementptr float, ptr %loadgep_, i64 %46
  store float %44, ptr %47, align 4
  %48 = add i64 %28, 1
  br label %omp.wsloop.region82

omp.par.outlined.exit93.exitStub:                 ; preds = %omp.par.pre_finalize60
  ret void
}

; Function Attrs: norecurse nounwind
define internal void @kernel_3mm..omp_par.1(ptr noalias %tid.addr14, ptr noalias %zero.addr15, ptr %0) #0 {
omp.par.entry16:
  %gep_.reloaded52 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_.reloaded52 = load ptr, ptr %gep_.reloaded52, align 8
  %gep_.reloaded53 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_.reloaded53 = load ptr, ptr %gep_.reloaded53, align 8
  %gep_.reloaded54 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 2
  %loadgep_.reloaded54 = load ptr, ptr %gep_.reloaded54, align 8
  %gep_ = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 3
  %loadgep_ = load ptr, ptr %gep_, align 8
  %gep_1 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 4
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  %gep_3 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 5
  %loadgep_4 = load ptr, ptr %gep_3, align 8
  %tid.addr.local19 = alloca i32, align 4
  %1 = load i32, ptr %tid.addr14, align 4
  store i32 %1, ptr %tid.addr.local19, align 4
  %tid20 = load i32, ptr %tid.addr.local19, align 4
  %2 = load i64, ptr %loadgep_.reloaded52, align 8
  %3 = load i64, ptr %loadgep_.reloaded53, align 8
  %4 = load i64, ptr %loadgep_.reloaded54, align 8
  %p.lastiter44 = alloca i32, align 4
  %p.lowerbound45 = alloca i64, align 8
  %p.upperbound46 = alloca i64, align 8
  %p.stride47 = alloca i64, align 8
  br label %omp.par.region17

omp.par.region17:                                 ; preds = %omp.par.entry16
  br label %omp.par.region24

omp.par.region24:                                 ; preds = %omp.par.region17
  %5 = select i1 false, i64 %2, i64 0
  %6 = select i1 false, i64 0, i64 %2
  %7 = sub nsw i64 %6, %5
  %8 = icmp sle i64 %6, %5
  %9 = sub i64 %7, 1
  %10 = udiv i64 %9, 1
  %11 = add i64 %10, 1
  %12 = icmp ule i64 %7, 1
  %13 = select i1 %12, i64 1, i64 %11
  %omp_loop.tripcount25 = select i1 %8, i64 0, i64 %13
  br label %omp_loop.preheader26

omp_loop.preheader26:                             ; preds = %omp.par.region24
  store i64 0, ptr %p.lowerbound45, align 8
  %14 = sub i64 %omp_loop.tripcount25, 1
  store i64 %14, ptr %p.upperbound46, align 8
  store i64 1, ptr %p.stride47, align 8
  %omp_global_thread_num48 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_8u(ptr @1, i32 %omp_global_thread_num48, i32 34, ptr %p.lastiter44, ptr %p.lowerbound45, ptr %p.upperbound46, ptr %p.stride47, i64 1, i64 0)
  %15 = load i64, ptr %p.lowerbound45, align 8
  %16 = load i64, ptr %p.upperbound46, align 8
  %17 = sub i64 %16, %15
  %18 = add i64 %17, 1
  br label %omp_loop.header27

omp_loop.header27:                                ; preds = %omp_loop.inc30, %omp_loop.preheader26
  %omp_loop.iv33 = phi i64 [ 0, %omp_loop.preheader26 ], [ %omp_loop.next35, %omp_loop.inc30 ]
  br label %omp_loop.cond28

omp_loop.cond28:                                  ; preds = %omp_loop.header27
  %omp_loop.cmp34 = icmp ult i64 %omp_loop.iv33, %18
  br i1 %omp_loop.cmp34, label %omp_loop.body29, label %omp_loop.exit31

omp_loop.exit31:                                  ; preds = %omp_loop.cond28
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num48)
  %omp_global_thread_num49 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num49)
  br label %omp_loop.after32

omp_loop.after32:                                 ; preds = %omp_loop.exit31
  br label %omp.region.cont23

omp.region.cont23:                                ; preds = %omp_loop.after32
  br label %omp.par.pre_finalize18

omp.par.pre_finalize18:                           ; preds = %omp.region.cont23
  br label %omp.par.outlined.exit51.exitStub

omp_loop.body29:                                  ; preds = %omp_loop.cond28
  %19 = add i64 %omp_loop.iv33, %15
  %20 = mul i64 %19, 1
  %21 = add i64 %20, 0
  br label %omp.wsloop.region37

omp.wsloop.region37:                              ; preds = %omp_loop.body29
  br label %omp.wsloop.region38

omp.wsloop.region38:                              ; preds = %omp.wsloop.region42, %omp.wsloop.region37
  %22 = phi i64 [ %29, %omp.wsloop.region42 ], [ 0, %omp.wsloop.region37 ]
  %23 = icmp slt i64 %22, %3
  br i1 %23, label %omp.wsloop.region39, label %omp.wsloop.region43

omp.wsloop.region43:                              ; preds = %omp.wsloop.region38
  br label %omp.region.cont36

omp.region.cont36:                                ; preds = %omp.wsloop.region43
  br label %omp_loop.inc30

omp_loop.inc30:                                   ; preds = %omp.region.cont36
  %omp_loop.next35 = add nuw i64 %omp_loop.iv33, 1
  br label %omp_loop.header27

omp.wsloop.region39:                              ; preds = %omp.wsloop.region38
  %24 = mul i64 %21, 32
  %25 = add i64 %24, %22
  %26 = getelementptr float, ptr %loadgep_, i64 %25
  store float 0.000000e+00, ptr %26, align 4
  br label %omp.wsloop.region40

omp.wsloop.region40:                              ; preds = %omp.wsloop.region41, %omp.wsloop.region39
  %27 = phi i64 [ %47, %omp.wsloop.region41 ], [ 0, %omp.wsloop.region39 ]
  %28 = icmp slt i64 %27, %4
  br i1 %28, label %omp.wsloop.region41, label %omp.wsloop.region42

omp.wsloop.region42:                              ; preds = %omp.wsloop.region40
  %29 = add i64 %22, 1
  br label %omp.wsloop.region38

omp.wsloop.region41:                              ; preds = %omp.wsloop.region40
  %30 = mul i64 %21, 32
  %31 = add i64 %30, %27
  %32 = getelementptr float, ptr %loadgep_2, i64 %31
  %33 = load float, ptr %32, align 4
  %34 = mul i64 %27, 32
  %35 = add i64 %34, %22
  %36 = getelementptr float, ptr %loadgep_4, i64 %35
  %37 = load float, ptr %36, align 4
  %38 = fmul float %33, %37
  %39 = mul i64 %21, 32
  %40 = add i64 %39, %22
  %41 = getelementptr float, ptr %loadgep_, i64 %40
  %42 = load float, ptr %41, align 4
  %43 = fadd float %42, %38
  %44 = mul i64 %21, 32
  %45 = add i64 %44, %22
  %46 = getelementptr float, ptr %loadgep_, i64 %45
  store float %43, ptr %46, align 4
  %47 = add i64 %27, 1
  br label %omp.wsloop.region40

omp.par.outlined.exit51.exitStub:                 ; preds = %omp.par.pre_finalize18
  ret void
}

; Function Attrs: norecurse nounwind
define internal void @kernel_3mm..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_.reloaded = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_.reloaded = load ptr, ptr %gep_.reloaded, align 8
  %gep_.reloaded11 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_.reloaded11 = load ptr, ptr %gep_.reloaded11, align 8
  %gep_.reloaded12 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 2
  %loadgep_.reloaded12 = load ptr, ptr %gep_.reloaded12, align 8
  %gep_ = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 3
  %loadgep_ = load ptr, ptr %gep_, align 8
  %gep_1 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 4
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  %gep_3 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 5
  %loadgep_4 = load ptr, ptr %gep_3, align 8
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  %2 = load i32, ptr %loadgep_.reloaded, align 4
  %3 = load i64, ptr %loadgep_.reloaded11, align 8
  %4 = load i64, ptr %loadgep_.reloaded12, align 8
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i64, align 8
  %p.upperbound = alloca i64, align 8
  %p.stride = alloca i64, align 8
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.par.entry
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  %5 = sext i32 %2 to i64
  %6 = select i1 false, i64 %5, i64 0
  %7 = select i1 false, i64 0, i64 %5
  %8 = sub nsw i64 %7, %6
  %9 = icmp sle i64 %7, %6
  %10 = sub i64 %8, 1
  %11 = udiv i64 %10, 1
  %12 = add i64 %11, 1
  %13 = icmp ule i64 %8, 1
  %14 = select i1 %13, i64 1, i64 %12
  %omp_loop.tripcount = select i1 %9, i64 0, i64 %14
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.par.region1
  store i64 0, ptr %p.lowerbound, align 8
  %15 = sub i64 %omp_loop.tripcount, 1
  store i64 %15, ptr %p.upperbound, align 8
  store i64 1, ptr %p.stride, align 8
  %omp_global_thread_num9 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_8u(ptr @1, i32 %omp_global_thread_num9, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i64 1, i64 0)
  %16 = load i64, ptr %p.lowerbound, align 8
  %17 = load i64, ptr %p.upperbound, align 8
  %18 = sub i64 %17, %16
  %19 = add i64 %18, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i64 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i64 %omp_loop.iv, %19
  br i1 %omp_loop.cmp, label %omp_loop.body, label %omp_loop.exit

omp_loop.exit:                                    ; preds = %omp_loop.cond
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num9)
  %omp_global_thread_num10 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num10)
  br label %omp_loop.after

omp_loop.after:                                   ; preds = %omp_loop.exit
  br label %omp.region.cont

omp.region.cont:                                  ; preds = %omp_loop.after
  br label %omp.par.pre_finalize

omp.par.pre_finalize:                             ; preds = %omp.region.cont
  br label %omp.par.outlined.exit.exitStub

omp_loop.body:                                    ; preds = %omp_loop.cond
  %20 = add i64 %omp_loop.iv, %16
  %21 = mul i64 %20, 1
  %22 = add i64 %21, 0
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body
  br label %omp.wsloop.region3

omp.wsloop.region3:                               ; preds = %omp.wsloop.region7, %omp.wsloop.region
  %23 = phi i64 [ %30, %omp.wsloop.region7 ], [ 0, %omp.wsloop.region ]
  %24 = icmp slt i64 %23, %3
  br i1 %24, label %omp.wsloop.region4, label %omp.wsloop.region8

omp.wsloop.region8:                               ; preds = %omp.wsloop.region3
  br label %omp.region.cont2

omp.region.cont2:                                 ; preds = %omp.wsloop.region8
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont2
  %omp_loop.next = add nuw i64 %omp_loop.iv, 1
  br label %omp_loop.header

omp.wsloop.region4:                               ; preds = %omp.wsloop.region3
  %25 = mul i64 %22, 32
  %26 = add i64 %25, %23
  %27 = getelementptr float, ptr %loadgep_, i64 %26
  store float 0.000000e+00, ptr %27, align 4
  br label %omp.wsloop.region5

omp.wsloop.region5:                               ; preds = %omp.wsloop.region6, %omp.wsloop.region4
  %28 = phi i64 [ %48, %omp.wsloop.region6 ], [ 0, %omp.wsloop.region4 ]
  %29 = icmp slt i64 %28, %4
  br i1 %29, label %omp.wsloop.region6, label %omp.wsloop.region7

omp.wsloop.region7:                               ; preds = %omp.wsloop.region5
  %30 = add i64 %23, 1
  br label %omp.wsloop.region3

omp.wsloop.region6:                               ; preds = %omp.wsloop.region5
  %31 = mul i64 %22, 32
  %32 = add i64 %31, %28
  %33 = getelementptr float, ptr %loadgep_2, i64 %32
  %34 = load float, ptr %33, align 4
  %35 = mul i64 %28, 32
  %36 = add i64 %35, %23
  %37 = getelementptr float, ptr %loadgep_4, i64 %36
  %38 = load float, ptr %37, align 4
  %39 = fmul float %34, %38
  %40 = mul i64 %22, 32
  %41 = add i64 %40, %23
  %42 = getelementptr float, ptr %loadgep_, i64 %41
  %43 = load float, ptr %42, align 4
  %44 = fadd float %43, %39
  %45 = mul i64 %22, 32
  %46 = add i64 %45, %23
  %47 = getelementptr float, ptr %loadgep_, i64 %46
  store float %44, ptr %47, align 4
  %48 = add i64 %28, 1
  br label %omp.wsloop.region5

omp.par.outlined.exit.exitStub:                   ; preds = %omp.par.pre_finalize
  ret void
}

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(ptr) #1

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_8u(ptr, i32, i32, ptr, ptr, ptr, ptr, i64, i64) #1

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) #1

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(ptr, i32) #2

; Function Attrs: nounwind
declare !callback !1 void @__kmpc_fork_call(ptr, i32, ptr, ...) #1

attributes #0 = { norecurse nounwind }
attributes #1 = { nounwind }
attributes #2 = { convergent nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!2}
!2 = !{i64 2, i64 -1, i64 -1, i1 true}
