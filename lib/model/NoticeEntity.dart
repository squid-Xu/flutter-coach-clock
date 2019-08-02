
/// 通知
class NoticeEntity {

  int id;
  String content;
  String title;
//  1：俱乐部发给学员app；2：俱乐部发给教练app；3：俱乐部发给学员和教练app；
//  4：平台发给学员用户app；5：平台发给教练用户app；6：平台发给学员和教练app；
//  7：平台发给俱乐部；8：平台发给所有用户
  int noticeType;
  String writer;
  int writerId;
  String writerImg;
  String createTime;
  bool haveRead;

  NoticeEntity(
      {this.id,
        this.content,
        this.title,
        this.noticeType,
        this.writer,
        this.writerId,
        this.writerImg,
        this.createTime,
        this.haveRead
      });

  NoticeEntity.fromJson(Map<String, dynamic> json,bool haveRead) {
    id = json['id'];
    content = json['content'];
    title = json['title'];
    noticeType = json['noticeType'];
    writer = json['writer'];
    writerId = json['writerId'];
    writerImg = json['writerImg'];
    createTime = json['createTime'];
    this.haveRead = haveRead;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['title'] = this.title;
    data['noticeType'] = this.noticeType;
    data['writer'] = this.writer;
    data['writerId'] = this.writerId;
    data['writerImg'] = this.writerImg;
    data['createTime'] = this.createTime;
    return data;
  }

  @override
  String toString() {
    return 'NoticeEntity{id: $id, content: $content, title: $title, noticeType: $noticeType, writer: $writer, writerId: $writerId, writerImg: $writerImg, createTime: $createTime, haveRead: $haveRead}';
  }


}