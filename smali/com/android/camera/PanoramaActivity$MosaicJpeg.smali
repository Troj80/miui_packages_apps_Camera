.class Lcom/android/camera/PanoramaActivity$MosaicJpeg;
.super Ljava/lang/Object;
.source "PanoramaActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/PanoramaActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MosaicJpeg"
.end annotation


# instance fields
.field public final data:[B

.field public final height:I

.field public final isValid:Z

.field final synthetic this$0:Lcom/android/camera/PanoramaActivity;

.field public final width:I


# direct methods
.method public constructor <init>(Lcom/android/camera/PanoramaActivity;)V
    .locals 2
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 176
    iput-object p1, p0, Lcom/android/camera/PanoramaActivity$MosaicJpeg;->this$0:Lcom/android/camera/PanoramaActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 177
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/PanoramaActivity$MosaicJpeg;->data:[B

    .line 178
    iput v1, p0, Lcom/android/camera/PanoramaActivity$MosaicJpeg;->width:I

    .line 179
    iput v1, p0, Lcom/android/camera/PanoramaActivity$MosaicJpeg;->height:I

    .line 180
    iput-boolean v1, p0, Lcom/android/camera/PanoramaActivity$MosaicJpeg;->isValid:Z

    .line 181
    return-void
.end method

.method public constructor <init>(Lcom/android/camera/PanoramaActivity;[BII)V
    .locals 1
    .parameter
    .parameter "data"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 169
    iput-object p1, p0, Lcom/android/camera/PanoramaActivity$MosaicJpeg;->this$0:Lcom/android/camera/PanoramaActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 170
    iput-object p2, p0, Lcom/android/camera/PanoramaActivity$MosaicJpeg;->data:[B

    .line 171
    iput p3, p0, Lcom/android/camera/PanoramaActivity$MosaicJpeg;->width:I

    .line 172
    iput p4, p0, Lcom/android/camera/PanoramaActivity$MosaicJpeg;->height:I

    .line 173
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/PanoramaActivity$MosaicJpeg;->isValid:Z

    .line 174
    return-void
.end method
