.class Lcom/android/camera/Camera$ImageNamer;
.super Ljava/lang/Thread;
.source "Camera.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/Camera;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ImageNamer"
.end annotation


# instance fields
.field private mDateTaken:J

.field private mHeight:I

.field private mRequestPending:Z

.field private mResolver:Landroid/content/ContentResolver;

.field private mStop:Z

.field private mSuffix:Ljava/lang/String;

.field private mTitle:Ljava/lang/String;

.field private mUri:Landroid/net/Uri;

.field private mWidth:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 1290
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 1291
    invoke-virtual {p0}, Lcom/android/camera/Camera$ImageNamer;->start()V

    .line 1292
    return-void
.end method

.method private cleanOldUri()V
    .locals 2

    .prologue
    .line 1371
    iget-object v0, p0, Lcom/android/camera/Camera$ImageNamer;->mUri:Landroid/net/Uri;

    if-nez v0, :cond_0

    .line 1374
    :goto_0
    return-void

    .line 1372
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera$ImageNamer;->mResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/camera/Camera$ImageNamer;->mUri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/android/camera/Storage;->deleteImage(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 1373
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/Camera$ImageNamer;->mUri:Landroid/net/Uri;

    goto :goto_0
.end method

.method private generateUri()V
    .locals 6

    .prologue
    .line 1362
    iget-wide v0, p0, Lcom/android/camera/Camera$ImageNamer;->mDateTaken:J

    invoke-static {v0, v1}, Lcom/android/camera/Util;->createJpegName(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Camera$ImageNamer;->mTitle:Ljava/lang/String;

    .line 1363
    iget-object v0, p0, Lcom/android/camera/Camera$ImageNamer;->mSuffix:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1364
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/android/camera/Camera$ImageNamer;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/Camera$ImageNamer;->mSuffix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Camera$ImageNamer;->mTitle:Ljava/lang/String;

    .line 1366
    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera$ImageNamer;->mResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/android/camera/Camera$ImageNamer;->mTitle:Ljava/lang/String;

    iget-wide v2, p0, Lcom/android/camera/Camera$ImageNamer;->mDateTaken:J

    iget v4, p0, Lcom/android/camera/Camera$ImageNamer;->mWidth:I

    iget v5, p0, Lcom/android/camera/Camera$ImageNamer;->mHeight:I

    invoke-static/range {v0 .. v5}, Lcom/android/camera/Storage;->newImage(Landroid/content/ContentResolver;Ljava/lang/String;JII)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Camera$ImageNamer;->mUri:Landroid/net/Uri;

    .line 1367
    return-void
.end method


# virtual methods
.method public declared-synchronized finish()V
    .locals 1

    .prologue
    .line 1356
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/android/camera/Camera$ImageNamer;->mStop:Z

    .line 1357
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1358
    monitor-exit p0

    return-void

    .line 1356
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1330
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/Camera$ImageNamer;->mTitle:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getUri()Landroid/net/Uri;
    .locals 2

    .prologue
    .line 1314
    monitor-enter p0

    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/Camera$ImageNamer;->mRequestPending:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 1316
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1317
    :catch_0
    move-exception v1

    goto :goto_0

    .line 1323
    :cond_0
    :try_start_2
    iget-object v0, p0, Lcom/android/camera/Camera$ImageNamer;->mUri:Landroid/net/Uri;

    .line 1324
    .local v0, uri:Landroid/net/Uri;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/camera/Camera$ImageNamer;->mUri:Landroid/net/Uri;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1325
    monitor-exit p0

    return-object v0

    .line 1314
    .end local v0           #uri:Landroid/net/Uri;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized prepareUri(Landroid/content/ContentResolver;JIIILjava/lang/String;)V
    .locals 2
    .parameter "resolver"
    .parameter "dateTaken"
    .parameter "width"
    .parameter "height"
    .parameter "rotation"
    .parameter "suffix"

    .prologue
    .line 1297
    monitor-enter p0

    :try_start_0
    rem-int/lit16 v1, p6, 0xb4

    if-eqz v1, :cond_0

    .line 1298
    move v0, p4

    .line 1299
    .local v0, tmp:I
    move p4, p5

    .line 1300
    move p5, v0

    .line 1302
    .end local v0           #tmp:I
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/Camera$ImageNamer;->mRequestPending:Z

    .line 1303
    iput-object p1, p0, Lcom/android/camera/Camera$ImageNamer;->mResolver:Landroid/content/ContentResolver;

    .line 1304
    iput-wide p2, p0, Lcom/android/camera/Camera$ImageNamer;->mDateTaken:J

    .line 1305
    iput p4, p0, Lcom/android/camera/Camera$ImageNamer;->mWidth:I

    .line 1306
    iput p5, p0, Lcom/android/camera/Camera$ImageNamer;->mHeight:I

    .line 1307
    iput-object p7, p0, Lcom/android/camera/Camera$ImageNamer;->mSuffix:Ljava/lang/String;

    .line 1308
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1309
    monitor-exit p0

    return-void

    .line 1297
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized run()V
    .locals 1

    .prologue
    .line 1337
    monitor-enter p0

    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lcom/android/camera/Camera$ImageNamer;->mStop:Z

    if-eqz v0, :cond_0

    .line 1351
    invoke-direct {p0}, Lcom/android/camera/Camera$ImageNamer;->cleanOldUri()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1352
    monitor-exit p0

    return-void

    .line 1338
    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lcom/android/camera/Camera$ImageNamer;->mRequestPending:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_1

    .line 1340
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 1341
    :catch_0
    move-exception v0

    goto :goto_0

    .line 1346
    :cond_1
    :try_start_3
    invoke-direct {p0}, Lcom/android/camera/Camera$ImageNamer;->cleanOldUri()V

    .line 1347
    invoke-direct {p0}, Lcom/android/camera/Camera$ImageNamer;->generateUri()V

    .line 1348
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/Camera$ImageNamer;->mRequestPending:Z

    .line 1349
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 1337
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
