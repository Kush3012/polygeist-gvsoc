; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-elf"

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
  br label %17

17:                                               ; preds = %36, %0
  %18 = phi i64 [ %37, %36 ], [ 0, %0 ]
  %19 = icmp slt i64 %18, 32
  br i1 %19, label %20, label %38

20:                                               ; preds = %17
  %21 = trunc i64 %18 to i32
  br label %22

22:                                               ; preds = %25, %20
  %23 = phi i64 [ %35, %25 ], [ 0, %20 ]
  %24 = icmp slt i64 %23, 32
  br i1 %24, label %25, label %36

25:                                               ; preds = %22
  %26 = trunc i64 %23 to i32
  %27 = add i32 %26, 2
  %28 = mul i32 %21, %27
  %29 = srem i32 %28, 32
  %30 = sitofp i32 %29 to float
  %31 = fdiv float %30, 3.200000e+01
  %32 = mul i64 %18, 32
  %33 = add i64 %32, %23
  %34 = getelementptr float, ptr %1, i64 %33
  store float %31, ptr %34, align 4
  %35 = add i64 %23, 1
  br label %22

36:                                               ; preds = %22
  %37 = add i64 %18, 1
  br label %17

38:                                               ; preds = %17
  br label %39

39:                                               ; preds = %80, %38
  %40 = phi i64 [ %81, %80 ], [ 0, %38 ]
  %41 = icmp slt i64 %40, 32
  br i1 %41, label %42, label %82

42:                                               ; preds = %39
  %43 = trunc i64 %40 to i32
  br label %44

44:                                               ; preds = %78, %42
  %45 = phi i64 [ %79, %78 ], [ 0, %42 ]
  %46 = icmp slt i64 %45, 32
  br i1 %46, label %47, label %80

47:                                               ; preds = %44
  %48 = mul i64 %40, 32
  %49 = add i64 %48, %45
  %50 = getelementptr float, ptr %9, i64 %49
  store float 0.000000e+00, ptr %50, align 4
  %51 = trunc i64 %45 to i32
  %52 = add i32 %51, 1
  br label %53

53:                                               ; preds = %56, %47
  %54 = phi i64 [ %77, %56 ], [ 0, %47 ]
  %55 = icmp slt i64 %54, 32
  br i1 %55, label %56, label %78

56:                                               ; preds = %53
  %57 = trunc i64 %54 to i32
  %58 = mul i32 %43, %57
  %59 = srem i32 %58, 32
  %60 = sitofp i32 %59 to float
  %61 = fdiv float %60, 3.200000e+01
  %62 = fmul float %61, 1.500000e+00
  %63 = add i32 %57, 1
  %64 = mul i32 %63, %52
  %65 = srem i32 %64, 32
  %66 = sitofp i32 %65 to float
  %67 = fdiv float %66, 3.200000e+01
  %68 = fmul float %62, %67
  %69 = mul i64 %40, 32
  %70 = add i64 %69, %45
  %71 = getelementptr float, ptr %9, i64 %70
  %72 = load float, ptr %71, align 4
  %73 = fadd float %72, %68
  %74 = mul i64 %40, 32
  %75 = add i64 %74, %45
  %76 = getelementptr float, ptr %9, i64 %75
  store float %73, ptr %76, align 4
  %77 = add i64 %54, 1
  br label %53

78:                                               ; preds = %53
  %79 = add i64 %45, 1
  br label %44

80:                                               ; preds = %44
  %81 = add i64 %40, 1
  br label %39

82:                                               ; preds = %39
  br label %83

83:                                               ; preds = %126, %82
  %84 = phi i64 [ %127, %126 ], [ 0, %82 ]
  %85 = icmp slt i64 %84, 32
  br i1 %85, label %86, label %128

86:                                               ; preds = %83
  br label %87

87:                                               ; preds = %124, %86
  %88 = phi i64 [ %125, %124 ], [ 0, %86 ]
  %89 = icmp slt i64 %88, 32
  br i1 %89, label %90, label %126

90:                                               ; preds = %87
  %91 = mul i64 %84, 32
  %92 = add i64 %91, %88
  %93 = getelementptr float, ptr %1, i64 %92
  %94 = load float, ptr %93, align 4
  %95 = fmul float %94, 0x3FF3333340000000
  %96 = mul i64 %84, 32
  %97 = add i64 %96, %88
  %98 = getelementptr float, ptr %1, i64 %97
  store float %95, ptr %98, align 4
  %99 = trunc i64 %88 to i32
  %100 = add i32 %99, 3
  br label %101

101:                                              ; preds = %104, %90
  %102 = phi i64 [ %123, %104 ], [ 0, %90 ]
  %103 = icmp slt i64 %102, 32
  br i1 %103, label %104, label %124

104:                                              ; preds = %101
  %105 = mul i64 %84, 32
  %106 = add i64 %105, %102
  %107 = getelementptr float, ptr %9, i64 %106
  %108 = load float, ptr %107, align 4
  %109 = trunc i64 %102 to i32
  %110 = mul i32 %109, %100
  %111 = srem i32 %110, 32
  %112 = sitofp i32 %111 to float
  %113 = fdiv float %112, 3.200000e+01
  %114 = fmul float %108, %113
  %115 = mul i64 %84, 32
  %116 = add i64 %115, %88
  %117 = getelementptr float, ptr %1, i64 %116
  %118 = load float, ptr %117, align 4
  %119 = fadd float %118, %114
  %120 = mul i64 %84, 32
  %121 = add i64 %120, %88
  %122 = getelementptr float, ptr %1, i64 %121
  store float %119, ptr %122, align 4
  %123 = add i64 %102, 1
  br label %101

124:                                              ; preds = %101
  %125 = add i64 %88, 1
  br label %87

126:                                              ; preds = %87
  %127 = add i64 %84, 1
  br label %83

128:                                              ; preds = %83
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

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
