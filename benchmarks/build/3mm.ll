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
  %17 = alloca float, i64 1024, align 4
  %18 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %17, 0
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %18, ptr %17, 1
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, i64 0, 2
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 32, 3, 0
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 32, 3, 1
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 32, 4, 0
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 1, 4, 1
  br label %25

25:                                               ; preds = %65, %0
  %26 = phi i64 [ %66, %65 ], [ 0, %0 ]
  %27 = icmp slt i64 %26, 32
  br i1 %27, label %28, label %67

28:                                               ; preds = %25
  %29 = trunc i64 %26 to i32
  br label %30

30:                                               ; preds = %63, %28
  %31 = phi i64 [ %64, %63 ], [ 0, %28 ]
  %32 = icmp slt i64 %31, 32
  br i1 %32, label %33, label %65

33:                                               ; preds = %30
  %34 = mul i64 %26, 32
  %35 = add i64 %34, %31
  %36 = getelementptr float, ptr %17, i64 %35
  store float 0.000000e+00, ptr %36, align 4
  %37 = trunc i64 %31 to i32
  %38 = add i32 %37, 1
  br label %39

39:                                               ; preds = %42, %33
  %40 = phi i64 [ %62, %42 ], [ 0, %33 ]
  %41 = icmp slt i64 %40, 32
  br i1 %41, label %42, label %63

42:                                               ; preds = %39
  %43 = trunc i64 %40 to i32
  %44 = mul i32 %29, %43
  %45 = srem i32 %44, 32
  %46 = sitofp i32 %45 to float
  %47 = fdiv float %46, 1.600000e+02
  %48 = add i32 %43, 1
  %49 = mul i32 %48, %38
  %50 = srem i32 %49, 32
  %51 = sitofp i32 %50 to float
  %52 = fdiv float %51, 1.600000e+02
  %53 = fmul float %47, %52
  %54 = mul i64 %26, 32
  %55 = add i64 %54, %31
  %56 = getelementptr float, ptr %17, i64 %55
  %57 = load float, ptr %56, align 4
  %58 = fadd float %57, %53
  %59 = mul i64 %26, 32
  %60 = add i64 %59, %31
  %61 = getelementptr float, ptr %17, i64 %60
  store float %58, ptr %61, align 4
  %62 = add i64 %40, 1
  br label %39

63:                                               ; preds = %39
  %64 = add i64 %31, 1
  br label %30

65:                                               ; preds = %30
  %66 = add i64 %26, 1
  br label %25

67:                                               ; preds = %25
  br label %68

68:                                               ; preds = %108, %67
  %69 = phi i64 [ %109, %108 ], [ 0, %67 ]
  %70 = icmp slt i64 %69, 32
  br i1 %70, label %71, label %110

71:                                               ; preds = %68
  %72 = trunc i64 %69 to i32
  br label %73

73:                                               ; preds = %106, %71
  %74 = phi i64 [ %107, %106 ], [ 0, %71 ]
  %75 = icmp slt i64 %74, 32
  br i1 %75, label %76, label %108

76:                                               ; preds = %73
  %77 = mul i64 %69, 32
  %78 = add i64 %77, %74
  %79 = getelementptr float, ptr %9, i64 %78
  store float 0.000000e+00, ptr %79, align 4
  %80 = trunc i64 %74 to i32
  %81 = add i32 %80, 2
  br label %82

82:                                               ; preds = %85, %76
  %83 = phi i64 [ %105, %85 ], [ 0, %76 ]
  %84 = icmp slt i64 %83, 32
  br i1 %84, label %85, label %106

85:                                               ; preds = %82
  %86 = trunc i64 %83 to i32
  %87 = add i32 %86, 3
  %88 = mul i32 %72, %87
  %89 = srem i32 %88, 32
  %90 = sitofp i32 %89 to float
  %91 = fdiv float %90, 1.600000e+02
  %92 = mul i32 %86, %81
  %93 = srem i32 %92, 32
  %94 = sitofp i32 %93 to float
  %95 = fdiv float %94, 1.600000e+02
  %96 = fmul float %91, %95
  %97 = mul i64 %69, 32
  %98 = add i64 %97, %74
  %99 = getelementptr float, ptr %9, i64 %98
  %100 = load float, ptr %99, align 4
  %101 = fadd float %100, %96
  %102 = mul i64 %69, 32
  %103 = add i64 %102, %74
  %104 = getelementptr float, ptr %9, i64 %103
  store float %101, ptr %104, align 4
  %105 = add i64 %83, 1
  br label %82

106:                                              ; preds = %82
  %107 = add i64 %74, 1
  br label %73

108:                                              ; preds = %73
  %109 = add i64 %69, 1
  br label %68

110:                                              ; preds = %68
  br label %111

111:                                              ; preds = %146, %110
  %112 = phi i64 [ %147, %146 ], [ 0, %110 ]
  %113 = icmp slt i64 %112, 32
  br i1 %113, label %114, label %148

114:                                              ; preds = %111
  br label %115

115:                                              ; preds = %144, %114
  %116 = phi i64 [ %145, %144 ], [ 0, %114 ]
  %117 = icmp slt i64 %116, 32
  br i1 %117, label %118, label %146

118:                                              ; preds = %115
  %119 = mul i64 %112, 32
  %120 = add i64 %119, %116
  %121 = getelementptr float, ptr %1, i64 %120
  store float 0.000000e+00, ptr %121, align 4
  br label %122

122:                                              ; preds = %125, %118
  %123 = phi i64 [ %143, %125 ], [ 0, %118 ]
  %124 = icmp slt i64 %123, 32
  br i1 %124, label %125, label %144

125:                                              ; preds = %122
  %126 = mul i64 %112, 32
  %127 = add i64 %126, %123
  %128 = getelementptr float, ptr %17, i64 %127
  %129 = load float, ptr %128, align 4
  %130 = mul i64 %123, 32
  %131 = add i64 %130, %116
  %132 = getelementptr float, ptr %9, i64 %131
  %133 = load float, ptr %132, align 4
  %134 = fmul float %129, %133
  %135 = mul i64 %112, 32
  %136 = add i64 %135, %116
  %137 = getelementptr float, ptr %1, i64 %136
  %138 = load float, ptr %137, align 4
  %139 = fadd float %138, %134
  %140 = mul i64 %112, 32
  %141 = add i64 %140, %116
  %142 = getelementptr float, ptr %1, i64 %141
  store float %139, ptr %142, align 4
  %143 = add i64 %123, 1
  br label %122

144:                                              ; preds = %122
  %145 = add i64 %116, 1
  br label %115

146:                                              ; preds = %115
  %147 = add i64 %112, 1
  br label %111

148:                                              ; preds = %111
  br label %149

149:                                              ; preds = %165, %148
  %150 = phi i64 [ %166, %165 ], [ 0, %148 ]
  %151 = phi float [ %156, %165 ], [ 0.000000e+00, %148 ]
  %152 = icmp slt i64 %150, 32
  br i1 %152, label %153, label %167

153:                                              ; preds = %149
  br label %154

154:                                              ; preds = %158, %153
  %155 = phi i64 [ %164, %158 ], [ 0, %153 ]
  %156 = phi float [ %163, %158 ], [ %151, %153 ]
  %157 = icmp slt i64 %155, 32
  br i1 %157, label %158, label %165

158:                                              ; preds = %154
  %159 = mul i64 %150, 32
  %160 = add i64 %159, %155
  %161 = getelementptr float, ptr %1, i64 %160
  %162 = load float, ptr %161, align 4
  %163 = fadd float %156, %162
  %164 = add i64 %155, 1
  br label %154

165:                                              ; preds = %154
  %166 = add i64 %150, 1
  br label %149

167:                                              ; preds = %149
  %168 = fcmp ogt float %151, 0.000000e+00
  %169 = xor i1 %168, true
  %170 = zext i1 %169 to i32
  ret i32 %170
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
