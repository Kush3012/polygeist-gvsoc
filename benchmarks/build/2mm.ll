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
  br label %41

41:                                               ; preds = %59, %0
  %42 = phi i64 [ %60, %59 ], [ 0, %0 ]
  %43 = icmp slt i64 %42, 32
  br i1 %43, label %44, label %61

44:                                               ; preds = %41
  %45 = trunc i64 %42 to i32
  br label %46

46:                                               ; preds = %49, %44
  %47 = phi i64 [ %58, %49 ], [ 0, %44 ]
  %48 = icmp slt i64 %47, 32
  br i1 %48, label %49, label %59

49:                                               ; preds = %46
  %50 = trunc i64 %47 to i32
  %51 = mul i32 %45, %50
  %52 = srem i32 %51, 32
  %53 = sitofp i32 %52 to float
  %54 = fdiv float %53, 3.200000e+01
  %55 = mul i64 %42, 32
  %56 = add i64 %55, %47
  %57 = getelementptr float, ptr %25, i64 %56
  store float %54, ptr %57, align 4
  %58 = add i64 %47, 1
  br label %46

59:                                               ; preds = %46
  %60 = add i64 %42, 1
  br label %41

61:                                               ; preds = %41
  br label %62

62:                                               ; preds = %82, %61
  %63 = phi i64 [ %83, %82 ], [ 0, %61 ]
  %64 = icmp slt i64 %63, 32
  br i1 %64, label %65, label %84

65:                                               ; preds = %62
  %66 = trunc i64 %63 to i32
  %67 = add i32 %66, 1
  br label %68

68:                                               ; preds = %71, %65
  %69 = phi i64 [ %81, %71 ], [ 0, %65 ]
  %70 = icmp slt i64 %69, 32
  br i1 %70, label %71, label %82

71:                                               ; preds = %68
  %72 = trunc i64 %69 to i32
  %73 = add i32 %72, 1
  %74 = mul i32 %67, %73
  %75 = srem i32 %74, 32
  %76 = sitofp i32 %75 to float
  %77 = fdiv float %76, 3.200000e+01
  %78 = mul i64 %63, 32
  %79 = add i64 %78, %69
  %80 = getelementptr float, ptr %17, i64 %79
  store float %77, ptr %80, align 4
  %81 = add i64 %69, 1
  br label %68

82:                                               ; preds = %68
  %83 = add i64 %63, 1
  br label %62

84:                                               ; preds = %62
  br label %85

85:                                               ; preds = %104, %84
  %86 = phi i64 [ %105, %104 ], [ 0, %84 ]
  %87 = icmp slt i64 %86, 32
  br i1 %87, label %88, label %106

88:                                               ; preds = %85
  %89 = trunc i64 %86 to i32
  br label %90

90:                                               ; preds = %93, %88
  %91 = phi i64 [ %103, %93 ], [ 0, %88 ]
  %92 = icmp slt i64 %91, 32
  br i1 %92, label %93, label %104

93:                                               ; preds = %90
  %94 = trunc i64 %91 to i32
  %95 = add i32 %94, 3
  %96 = mul i32 %89, %95
  %97 = srem i32 %96, 32
  %98 = sitofp i32 %97 to float
  %99 = fdiv float %98, 3.200000e+01
  %100 = mul i64 %86, 32
  %101 = add i64 %100, %91
  %102 = getelementptr float, ptr %9, i64 %101
  store float %99, ptr %102, align 4
  %103 = add i64 %91, 1
  br label %90

104:                                              ; preds = %90
  %105 = add i64 %86, 1
  br label %85

106:                                              ; preds = %85
  br label %107

107:                                              ; preds = %126, %106
  %108 = phi i64 [ %127, %126 ], [ 0, %106 ]
  %109 = icmp slt i64 %108, 32
  br i1 %109, label %110, label %128

110:                                              ; preds = %107
  %111 = trunc i64 %108 to i32
  br label %112

112:                                              ; preds = %115, %110
  %113 = phi i64 [ %125, %115 ], [ 0, %110 ]
  %114 = icmp slt i64 %113, 32
  br i1 %114, label %115, label %126

115:                                              ; preds = %112
  %116 = trunc i64 %113 to i32
  %117 = add i32 %116, 2
  %118 = mul i32 %111, %117
  %119 = srem i32 %118, 32
  %120 = sitofp i32 %119 to float
  %121 = fdiv float %120, 3.200000e+01
  %122 = mul i64 %108, 32
  %123 = add i64 %122, %113
  %124 = getelementptr float, ptr %1, i64 %123
  store float %121, ptr %124, align 4
  %125 = add i64 %113, 1
  br label %112

126:                                              ; preds = %112
  %127 = add i64 %108, 1
  br label %107

128:                                              ; preds = %107
  call void @kernel_2mm(i32 32, i32 32, i32 32, i32 32, float 1.500000e+00, float 0x3FF3333340000000, ptr %33, ptr %33, i64 0, i64 32, i64 32, i64 32, i64 1, ptr %25, ptr %25, i64 0, i64 32, i64 32, i64 32, i64 1, ptr %17, ptr %17, i64 0, i64 32, i64 32, i64 32, i64 1, ptr %9, ptr %9, i64 0, i64 32, i64 32, i64 32, i64 1, ptr %1, ptr %1, i64 0, i64 32, i64 32, i64 32, i64 1)
  br label %129

129:                                              ; preds = %145, %128
  %130 = phi i64 [ %146, %145 ], [ 0, %128 ]
  %131 = phi float [ %136, %145 ], [ 0.000000e+00, %128 ]
  %132 = icmp slt i64 %130, 32
  br i1 %132, label %133, label %147

133:                                              ; preds = %129
  br label %134

134:                                              ; preds = %138, %133
  %135 = phi i64 [ %144, %138 ], [ 0, %133 ]
  %136 = phi float [ %143, %138 ], [ %131, %133 ]
  %137 = icmp slt i64 %135, 32
  br i1 %137, label %138, label %145

138:                                              ; preds = %134
  %139 = mul i64 %130, 32
  %140 = add i64 %139, %135
  %141 = getelementptr float, ptr %1, i64 %140
  %142 = load float, ptr %141, align 4
  %143 = fadd float %136, %142
  %144 = add i64 %135, 1
  br label %134

145:                                              ; preds = %134
  %146 = add i64 %130, 1
  br label %129

147:                                              ; preds = %129
  %148 = fcmp ogt float %131, 0.000000e+00
  %149 = xor i1 %148, true
  %150 = zext i1 %149 to i32
  ret i32 %150
}

define internal void @kernel_2mm(i32 %0, i32 %1, i32 %2, i32 %3, float %4, float %5, ptr %6, ptr %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, ptr %13, ptr %14, i64 %15, i64 %16, i64 %17, i64 %18, i64 %19, ptr %20, ptr %21, i64 %22, i64 %23, i64 %24, i64 %25, i64 %26, ptr %27, ptr %28, i64 %29, i64 %30, i64 %31, i64 %32, i64 %33, ptr %34, ptr %35, i64 %36, i64 %37, i64 %38, i64 %39, i64 %40) {
  %structArg59 = alloca { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, align 8
  %structArg = alloca { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, align 8
  %.reloaded53 = alloca i32, align 4
  %.reloaded54 = alloca i64, align 8
  %.reloaded55 = alloca float, align 4
  %.reloaded56 = alloca i64, align 8
  %.reloaded = alloca i32, align 4
  %.reloaded11 = alloca i64, align 8
  %.reloaded12 = alloca i64, align 8
  %.reloaded13 = alloca float, align 4
  %42 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %6, 0
  %43 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %42, ptr %7, 1
  %44 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %43, i64 %8, 2
  %45 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %44, i64 %9, 3, 0
  %46 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %45, i64 %11, 4, 0
  %47 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %46, i64 %10, 3, 1
  %48 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %47, i64 %12, 4, 1
  %49 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %13, 0
  %50 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %49, ptr %14, 1
  %51 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %50, i64 %15, 2
  %52 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %51, i64 %16, 3, 0
  %53 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %52, i64 %18, 4, 0
  %54 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %53, i64 %17, 3, 1
  %55 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %54, i64 %19, 4, 1
  %56 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %20, 0
  %57 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %56, ptr %21, 1
  %58 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %57, i64 %22, 2
  %59 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %58, i64 %23, 3, 0
  %60 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %59, i64 %25, 4, 0
  %61 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %60, i64 %24, 3, 1
  %62 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %61, i64 %26, 4, 1
  %63 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %27, 0
  %64 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %63, ptr %28, 1
  %65 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %64, i64 %29, 2
  %66 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %65, i64 %30, 3, 0
  %67 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %66, i64 %32, 4, 0
  %68 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %67, i64 %31, 3, 1
  %69 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %68, i64 %33, 4, 1
  %70 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %34, 0
  %71 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %70, ptr %35, 1
  %72 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %71, i64 %36, 2
  %73 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %72, i64 %37, 3, 0
  %74 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %73, i64 %39, 4, 0
  %75 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %74, i64 %38, 3, 1
  %76 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %75, i64 %40, 4, 1
  %77 = sext i32 %2 to i64
  %78 = sext i32 %3 to i64
  %79 = sext i32 %1 to i64
  br label %entry

entry:                                            ; preds = %41
  %omp_global_thread_num = call i32 @__kmpc_global_thread_num(ptr @1)
  store i32 %0, ptr %.reloaded, align 4
  store i64 %79, ptr %.reloaded11, align 8
  store i64 %77, ptr %.reloaded12, align 8
  store float %4, ptr %.reloaded13, align 4
  br label %omp_parallel

omp_parallel:                                     ; preds = %entry
  %gep_.reloaded = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 0
  store ptr %.reloaded, ptr %gep_.reloaded, align 8
  %gep_.reloaded11 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 1
  store ptr %.reloaded11, ptr %gep_.reloaded11, align 8
  %gep_.reloaded12 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 2
  store ptr %.reloaded12, ptr %gep_.reloaded12, align 8
  %gep_.reloaded13 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 3
  store ptr %.reloaded13, ptr %gep_.reloaded13, align 8
  %gep_ = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 4
  store ptr %7, ptr %gep_, align 8
  %gep_57 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 5
  store ptr %14, ptr %gep_57, align 8
  %gep_58 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg, i32 0, i32 6
  store ptr %21, ptr %gep_58, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @kernel_2mm..omp_par, ptr %structArg)
  br label %omp.par.outlined.exit

omp.par.outlined.exit:                            ; preds = %omp_parallel
  br label %omp.par.exit.split

omp.par.exit.split:                               ; preds = %omp.par.outlined.exit
  %omp_global_thread_num14 = call i32 @__kmpc_global_thread_num(ptr @1)
  store i32 %0, ptr %.reloaded53, align 4
  store i64 %78, ptr %.reloaded54, align 8
  store float %5, ptr %.reloaded55, align 4
  store i64 %79, ptr %.reloaded56, align 8
  br label %omp_parallel63

omp_parallel63:                                   ; preds = %omp.par.exit.split
  %gep_.reloaded53 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg59, i32 0, i32 0
  store ptr %.reloaded53, ptr %gep_.reloaded53, align 8
  %gep_.reloaded54 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg59, i32 0, i32 1
  store ptr %.reloaded54, ptr %gep_.reloaded54, align 8
  %gep_.reloaded55 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg59, i32 0, i32 2
  store ptr %.reloaded55, ptr %gep_.reloaded55, align 8
  %gep_.reloaded56 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg59, i32 0, i32 3
  store ptr %.reloaded56, ptr %gep_.reloaded56, align 8
  %gep_60 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg59, i32 0, i32 4
  store ptr %35, ptr %gep_60, align 8
  %gep_61 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg59, i32 0, i32 5
  store ptr %7, ptr %gep_61, align 8
  %gep_62 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %structArg59, i32 0, i32 6
  store ptr %28, ptr %gep_62, align 8
  call void (ptr, i32, ptr, ...) @__kmpc_fork_call(ptr @1, i32 1, ptr @kernel_2mm..omp_par.1, ptr %structArg59)
  br label %omp.par.outlined.exit52

omp.par.outlined.exit52:                          ; preds = %omp_parallel63
  br label %omp.par.exit.split51

omp.par.exit.split51:                             ; preds = %omp.par.outlined.exit52
  ret void
}

; Function Attrs: norecurse nounwind
define internal void @kernel_2mm..omp_par.1(ptr noalias %tid.addr15, ptr noalias %zero.addr16, ptr %0) #0 {
omp.par.entry17:
  %gep_.reloaded53 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_.reloaded53 = load ptr, ptr %gep_.reloaded53, align 8
  %gep_.reloaded54 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_.reloaded54 = load ptr, ptr %gep_.reloaded54, align 8
  %gep_.reloaded55 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 2
  %loadgep_.reloaded55 = load ptr, ptr %gep_.reloaded55, align 8
  %gep_.reloaded56 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 3
  %loadgep_.reloaded56 = load ptr, ptr %gep_.reloaded56, align 8
  %gep_ = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 4
  %loadgep_ = load ptr, ptr %gep_, align 8
  %gep_1 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 5
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  %gep_3 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 6
  %loadgep_4 = load ptr, ptr %gep_3, align 8
  %tid.addr.local20 = alloca i32, align 4
  %1 = load i32, ptr %tid.addr15, align 4
  store i32 %1, ptr %tid.addr.local20, align 4
  %tid21 = load i32, ptr %tid.addr.local20, align 4
  %2 = load i32, ptr %loadgep_.reloaded53, align 4
  %3 = load i64, ptr %loadgep_.reloaded54, align 8
  %4 = load float, ptr %loadgep_.reloaded55, align 4
  %5 = load i64, ptr %loadgep_.reloaded56, align 8
  %p.lastiter45 = alloca i32, align 4
  %p.lowerbound46 = alloca i64, align 8
  %p.upperbound47 = alloca i64, align 8
  %p.stride48 = alloca i64, align 8
  br label %omp.par.region18

omp.par.region18:                                 ; preds = %omp.par.entry17
  br label %omp.par.region25

omp.par.region25:                                 ; preds = %omp.par.region18
  %6 = sext i32 %2 to i64
  %7 = select i1 false, i64 %6, i64 0
  %8 = select i1 false, i64 0, i64 %6
  %9 = sub nsw i64 %8, %7
  %10 = icmp sle i64 %8, %7
  %11 = sub i64 %9, 1
  %12 = udiv i64 %11, 1
  %13 = add i64 %12, 1
  %14 = icmp ule i64 %9, 1
  %15 = select i1 %14, i64 1, i64 %13
  %omp_loop.tripcount26 = select i1 %10, i64 0, i64 %15
  br label %omp_loop.preheader27

omp_loop.preheader27:                             ; preds = %omp.par.region25
  store i64 0, ptr %p.lowerbound46, align 8
  %16 = sub i64 %omp_loop.tripcount26, 1
  store i64 %16, ptr %p.upperbound47, align 8
  store i64 1, ptr %p.stride48, align 8
  %omp_global_thread_num49 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_8u(ptr @1, i32 %omp_global_thread_num49, i32 34, ptr %p.lastiter45, ptr %p.lowerbound46, ptr %p.upperbound47, ptr %p.stride48, i64 1, i64 0)
  %17 = load i64, ptr %p.lowerbound46, align 8
  %18 = load i64, ptr %p.upperbound47, align 8
  %19 = sub i64 %18, %17
  %20 = add i64 %19, 1
  br label %omp_loop.header28

omp_loop.header28:                                ; preds = %omp_loop.inc31, %omp_loop.preheader27
  %omp_loop.iv34 = phi i64 [ 0, %omp_loop.preheader27 ], [ %omp_loop.next36, %omp_loop.inc31 ]
  br label %omp_loop.cond29

omp_loop.cond29:                                  ; preds = %omp_loop.header28
  %omp_loop.cmp35 = icmp ult i64 %omp_loop.iv34, %20
  br i1 %omp_loop.cmp35, label %omp_loop.body30, label %omp_loop.exit32

omp_loop.exit32:                                  ; preds = %omp_loop.cond29
  call void @__kmpc_for_static_fini(ptr @1, i32 %omp_global_thread_num49)
  %omp_global_thread_num50 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_barrier(ptr @2, i32 %omp_global_thread_num50)
  br label %omp_loop.after33

omp_loop.after33:                                 ; preds = %omp_loop.exit32
  br label %omp.region.cont24

omp.region.cont24:                                ; preds = %omp_loop.after33
  br label %omp.par.pre_finalize19

omp.par.pre_finalize19:                           ; preds = %omp.region.cont24
  br label %omp.par.outlined.exit52.exitStub

omp_loop.body30:                                  ; preds = %omp_loop.cond29
  %21 = add i64 %omp_loop.iv34, %17
  %22 = mul i64 %21, 1
  %23 = add i64 %22, 0
  br label %omp.wsloop.region38

omp.wsloop.region38:                              ; preds = %omp_loop.body30
  br label %omp.wsloop.region39

omp.wsloop.region39:                              ; preds = %omp.wsloop.region43, %omp.wsloop.region38
  %24 = phi i64 [ %36, %omp.wsloop.region43 ], [ 0, %omp.wsloop.region38 ]
  %25 = icmp slt i64 %24, %3
  br i1 %25, label %omp.wsloop.region40, label %omp.wsloop.region44

omp.wsloop.region44:                              ; preds = %omp.wsloop.region39
  br label %omp.region.cont37

omp.region.cont37:                                ; preds = %omp.wsloop.region44
  br label %omp_loop.inc31

omp_loop.inc31:                                   ; preds = %omp.region.cont37
  %omp_loop.next36 = add nuw i64 %omp_loop.iv34, 1
  br label %omp_loop.header28

omp.wsloop.region40:                              ; preds = %omp.wsloop.region39
  %26 = mul i64 %23, 32
  %27 = add i64 %26, %24
  %28 = getelementptr float, ptr %loadgep_, i64 %27
  %29 = load float, ptr %28, align 4
  %30 = fmul float %29, %4
  %31 = mul i64 %23, 32
  %32 = add i64 %31, %24
  %33 = getelementptr float, ptr %loadgep_, i64 %32
  store float %30, ptr %33, align 4
  br label %omp.wsloop.region41

omp.wsloop.region41:                              ; preds = %omp.wsloop.region42, %omp.wsloop.region40
  %34 = phi i64 [ %54, %omp.wsloop.region42 ], [ 0, %omp.wsloop.region40 ]
  %35 = icmp slt i64 %34, %5
  br i1 %35, label %omp.wsloop.region42, label %omp.wsloop.region43

omp.wsloop.region43:                              ; preds = %omp.wsloop.region41
  %36 = add i64 %24, 1
  br label %omp.wsloop.region39

omp.wsloop.region42:                              ; preds = %omp.wsloop.region41
  %37 = mul i64 %23, 32
  %38 = add i64 %37, %34
  %39 = getelementptr float, ptr %loadgep_2, i64 %38
  %40 = load float, ptr %39, align 4
  %41 = mul i64 %34, 32
  %42 = add i64 %41, %24
  %43 = getelementptr float, ptr %loadgep_4, i64 %42
  %44 = load float, ptr %43, align 4
  %45 = fmul float %40, %44
  %46 = mul i64 %23, 32
  %47 = add i64 %46, %24
  %48 = getelementptr float, ptr %loadgep_, i64 %47
  %49 = load float, ptr %48, align 4
  %50 = fadd float %49, %45
  %51 = mul i64 %23, 32
  %52 = add i64 %51, %24
  %53 = getelementptr float, ptr %loadgep_, i64 %52
  store float %50, ptr %53, align 4
  %54 = add i64 %34, 1
  br label %omp.wsloop.region41

omp.par.outlined.exit52.exitStub:                 ; preds = %omp.par.pre_finalize19
  ret void
}

; Function Attrs: norecurse nounwind
define internal void @kernel_2mm..omp_par(ptr noalias %tid.addr, ptr noalias %zero.addr, ptr %0) #0 {
omp.par.entry:
  %gep_.reloaded = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 0
  %loadgep_.reloaded = load ptr, ptr %gep_.reloaded, align 8
  %gep_.reloaded11 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 1
  %loadgep_.reloaded11 = load ptr, ptr %gep_.reloaded11, align 8
  %gep_.reloaded12 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 2
  %loadgep_.reloaded12 = load ptr, ptr %gep_.reloaded12, align 8
  %gep_.reloaded13 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 3
  %loadgep_.reloaded13 = load ptr, ptr %gep_.reloaded13, align 8
  %gep_ = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 4
  %loadgep_ = load ptr, ptr %gep_, align 8
  %gep_1 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 5
  %loadgep_2 = load ptr, ptr %gep_1, align 8
  %gep_3 = getelementptr { ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %0, i32 0, i32 6
  %loadgep_4 = load ptr, ptr %gep_3, align 8
  %tid.addr.local = alloca i32, align 4
  %1 = load i32, ptr %tid.addr, align 4
  store i32 %1, ptr %tid.addr.local, align 4
  %tid = load i32, ptr %tid.addr.local, align 4
  %2 = load i32, ptr %loadgep_.reloaded, align 4
  %3 = load i64, ptr %loadgep_.reloaded11, align 8
  %4 = load i64, ptr %loadgep_.reloaded12, align 8
  %5 = load float, ptr %loadgep_.reloaded13, align 4
  %p.lastiter = alloca i32, align 4
  %p.lowerbound = alloca i64, align 8
  %p.upperbound = alloca i64, align 8
  %p.stride = alloca i64, align 8
  br label %omp.par.region

omp.par.region:                                   ; preds = %omp.par.entry
  br label %omp.par.region1

omp.par.region1:                                  ; preds = %omp.par.region
  %6 = sext i32 %2 to i64
  %7 = select i1 false, i64 %6, i64 0
  %8 = select i1 false, i64 0, i64 %6
  %9 = sub nsw i64 %8, %7
  %10 = icmp sle i64 %8, %7
  %11 = sub i64 %9, 1
  %12 = udiv i64 %11, 1
  %13 = add i64 %12, 1
  %14 = icmp ule i64 %9, 1
  %15 = select i1 %14, i64 1, i64 %13
  %omp_loop.tripcount = select i1 %10, i64 0, i64 %15
  br label %omp_loop.preheader

omp_loop.preheader:                               ; preds = %omp.par.region1
  store i64 0, ptr %p.lowerbound, align 8
  %16 = sub i64 %omp_loop.tripcount, 1
  store i64 %16, ptr %p.upperbound, align 8
  store i64 1, ptr %p.stride, align 8
  %omp_global_thread_num9 = call i32 @__kmpc_global_thread_num(ptr @1)
  call void @__kmpc_for_static_init_8u(ptr @1, i32 %omp_global_thread_num9, i32 34, ptr %p.lastiter, ptr %p.lowerbound, ptr %p.upperbound, ptr %p.stride, i64 1, i64 0)
  %17 = load i64, ptr %p.lowerbound, align 8
  %18 = load i64, ptr %p.upperbound, align 8
  %19 = sub i64 %18, %17
  %20 = add i64 %19, 1
  br label %omp_loop.header

omp_loop.header:                                  ; preds = %omp_loop.inc, %omp_loop.preheader
  %omp_loop.iv = phi i64 [ 0, %omp_loop.preheader ], [ %omp_loop.next, %omp_loop.inc ]
  br label %omp_loop.cond

omp_loop.cond:                                    ; preds = %omp_loop.header
  %omp_loop.cmp = icmp ult i64 %omp_loop.iv, %20
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
  %21 = add i64 %omp_loop.iv, %17
  %22 = mul i64 %21, 1
  %23 = add i64 %22, 0
  br label %omp.wsloop.region

omp.wsloop.region:                                ; preds = %omp_loop.body
  br label %omp.wsloop.region3

omp.wsloop.region3:                               ; preds = %omp.wsloop.region7, %omp.wsloop.region
  %24 = phi i64 [ %31, %omp.wsloop.region7 ], [ 0, %omp.wsloop.region ]
  %25 = icmp slt i64 %24, %3
  br i1 %25, label %omp.wsloop.region4, label %omp.wsloop.region8

omp.wsloop.region8:                               ; preds = %omp.wsloop.region3
  br label %omp.region.cont2

omp.region.cont2:                                 ; preds = %omp.wsloop.region8
  br label %omp_loop.inc

omp_loop.inc:                                     ; preds = %omp.region.cont2
  %omp_loop.next = add nuw i64 %omp_loop.iv, 1
  br label %omp_loop.header

omp.wsloop.region4:                               ; preds = %omp.wsloop.region3
  %26 = mul i64 %23, 32
  %27 = add i64 %26, %24
  %28 = getelementptr float, ptr %loadgep_, i64 %27
  store float 0.000000e+00, ptr %28, align 4
  br label %omp.wsloop.region5

omp.wsloop.region5:                               ; preds = %omp.wsloop.region6, %omp.wsloop.region4
  %29 = phi i64 [ %50, %omp.wsloop.region6 ], [ 0, %omp.wsloop.region4 ]
  %30 = icmp slt i64 %29, %4
  br i1 %30, label %omp.wsloop.region6, label %omp.wsloop.region7

omp.wsloop.region7:                               ; preds = %omp.wsloop.region5
  %31 = add i64 %24, 1
  br label %omp.wsloop.region3

omp.wsloop.region6:                               ; preds = %omp.wsloop.region5
  %32 = mul i64 %23, 32
  %33 = add i64 %32, %29
  %34 = getelementptr float, ptr %loadgep_2, i64 %33
  %35 = load float, ptr %34, align 4
  %36 = fmul float %5, %35
  %37 = mul i64 %29, 32
  %38 = add i64 %37, %24
  %39 = getelementptr float, ptr %loadgep_4, i64 %38
  %40 = load float, ptr %39, align 4
  %41 = fmul float %36, %40
  %42 = mul i64 %23, 32
  %43 = add i64 %42, %24
  %44 = getelementptr float, ptr %loadgep_, i64 %43
  %45 = load float, ptr %44, align 4
  %46 = fadd float %45, %41
  %47 = mul i64 %23, 32
  %48 = add i64 %47, %24
  %49 = getelementptr float, ptr %loadgep_, i64 %48
  store float %46, ptr %49, align 4
  %50 = add i64 %29, 1
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
