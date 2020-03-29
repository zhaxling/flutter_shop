class NewGroupModel {
  String menuId;
  int index;
  String nextMenutype;
  String isComment;
  String chinaTitle;
  String centerType;
  List<NewsModel> childList;
  String haveMore;

  NewGroupModel(
      {this.menuId,
        this.index,
        this.nextMenutype,
        this.isComment,
        this.chinaTitle,
        this.centerType,
        this.childList,
        this.haveMore});

  NewGroupModel.fromJson(Map<String, dynamic> json) {
    menuId = json['menuId'];
    index = json['index'];
    nextMenutype = json['nextMenutype'];
    isComment = json['isComment'];
    chinaTitle = json['chinaTitle'];
    centerType = json['centerType'];
    if (json['childList'] != null) {
      childList = new List<NewsModel>();
      json['childList'].forEach((v) {
        childList.add(new NewsModel.fromJson(v));
      });
    }
    haveMore = json['haveMore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menuId'] = this.menuId;
    data['index'] = this.index;
    data['nextMenutype'] = this.nextMenutype;
    data['isComment'] = this.isComment;
    data['chinaTitle'] = this.chinaTitle;
    data['centerType'] = this.centerType;
    if (this.childList != null) {
      data['childList'] = this.childList.map((v) => v.toJson()).toList();
    }
    data['haveMore'] = this.haveMore;
    return data;
  }
}

class NewsModel {
  String menuId;
  String nextMenutype;
  String objId;
  String isComment;
  String inforSources;
  String path;
  String chinaTitle;
  String recordDate;
  String summary;
  String centerType;
  String h5Url;
  String haveMore;

  NewsModel(
      {this.menuId,
        this.nextMenutype,
        this.objId,
        this.isComment,
        this.inforSources,
        this.path,
        this.chinaTitle,
        this.recordDate,
        this.summary,
        this.centerType,
        this.h5Url,
        this.haveMore});

  NewsModel.fromJson(Map<String, dynamic> json) {
    menuId = json['menuId'];
    nextMenutype = json['nextMenutype'];
    objId = json['objId'];
    isComment = json['isComment'];
    inforSources = json['inforSources'];
    path = json['path'];
    chinaTitle = json['chinaTitle'];
    recordDate = json['recordDate'];
    summary = json['summary'];
    centerType = json['centerType'];
    h5Url = json['h5Url'];
    haveMore = json['haveMore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menuId'] = this.menuId;
    data['nextMenutype'] = this.nextMenutype;
    data['objId'] = this.objId;
    data['isComment'] = this.isComment;
    data['inforSources'] = this.inforSources;
    data['path'] = this.path;
    data['chinaTitle'] = this.chinaTitle;
    data['recordDate'] = this.recordDate;
    data['summary'] = this.summary;
    data['centerType'] = this.centerType;
    data['h5Url'] = this.h5Url;
    data['haveMore'] = this.haveMore;
    return data;
  }
}


/*{
	"message" : "成功",
	"data" : {
		"newsCenterList" : [
			{
				"menuId" : "e652dd56-dcf7-11e8-ad66-000c295098d3",
				"index" : 1,
				"nextMenutype" : "2",
				"isComment" : "1",
				"chinaTitle" : "公司要闻",
				"centerType" : "1",
				"childList" : [
					{
						"menuId" : "e652dd56-dcf7-11e8-ad66-000c295098d3",
						"nextMenutype" : "1",
						"objId" : "31463985-a046-4c13-98a3-dbc34c12eb56",
						"isComment" : "0",
						"inforSources" : "重庆电力交易中心",
						"path" : "",
						"chinaTitle" : "国家电网公司16.3亿千瓦时“藏电入渝” 消纳框架协议签约仪式在重庆举行",
						"recordDate" : "2018-05-29 15:06:50",
						"summary" : "2018年5月29日，国家电网公司16.3亿千瓦时“藏电入渝”消纳框架协议签约仪式在重庆举行。",
						"centerType" : "1",
						"h5Url" : "",
						"haveMore" : "0"
					},
					{
						"menuId" : "e652dd56-dcf7-11e8-ad66-000c295098d3",
						"nextMenutype" : "1",
						"objId" : "b777ba8d-52d6-4729-befb-ec051cedde72",
						"isComment" : "0",
						"inforSources" : "新疆电力交易中心",
						"path" : "",
						"chinaTitle" : "新疆电力中长期交易实施细则发布",
						"recordDate" : "2018-05-21 15:17:22",
						"summary" : "2018年5月21日新疆电力交易中心配合新疆能监办编制的《新疆电力中长期交易实施细则》（试行）发布。",
						"centerType" : "1",
						"h5Url" : "",
						"haveMore" : "0"
					},
					{
						"menuId" : "e652dd56-dcf7-11e8-ad66-000c295098d3",
						"nextMenutype" : "1",
						"objId" : "b777ba8d-52-befb-ec051cedde72",
						"isComment" : "0",
						"inforSources" : "新疆电力交易中心",
						"path" : "",
						"chinaTitle" : "新疆电力中长期交易实施细则发布",
						"recordDate" : "2018-05-21 15:17:22",
						"summary" : "2018年5月21日新疆电力交易中心配合新疆能监办编制的《新疆电力中长期交易实施细则》（试行）发布。",
						"centerType" : "1",
						"h5Url" : "",
						"haveMore" : "0"
					}
				],
				"haveMore" : "1"
			},
			{
				"menuId" : "ef750818-dcf7-11e8-ad66-000c295098d3",
				"index" : 2,
				"nextMenutype" : "2",
				"isComment" : "1",
				"chinaTitle" : "行业资讯",
				"centerType" : "1",
				"childList" : [
					{
						"menuId" : "ef750818-dcf7-11e8-ad66-000c295098d3",
						"nextMenutype" : "1",
						"objId" : "1be48ca3-eadc-4e6c-b064-8da4707424b6",
						"isComment" : "0",
						"inforSources" : "辽宁电力交易中心有限公司",
						"path" : "https://file.nepx.com/bpx/uploadFile/2020/20200103090210_20191231183804248536871.jpg",
						"chinaTitle" : "组织开展2019年跨省电力市场化交易",
						"recordDate" : "2019-09-17 16:18:02",
						"summary" : "按照省工业和信息化厅，国家能漂局东北监管局联合印发的《辽宁省2019年电力市场化交易工作方案》安排，2019年跨省电力市场化易实施细则》（试行）发布。",
						"centerType" : "1",
						"h5Url" : "",
						"haveMore" : "0"
					}
				],
				"haveMore" : "1"
			},
			{
				"menuId" : "ef750818-dcf7-11e8-ad66-000c295098d3",
				"index" : 2,
				"nextMenutype" : "2",
				"isComment" : "1",
				"chinaTitle" : "行业资讯",
				"centerType" : "1",
				"childList" : [
					{
						"menuId" : "ef750818-dcf7-11e8-ad66-000c295098d3",
						"nextMenutype" : "1",
						"objId" : "1be48ca3-eadc-4e6c-b064-8da4707424b6",
						"isComment" : "0",
						"inforSources" : "辽宁电力交易中心有限公司",
						"path" : "https://file.nepx.com/bpx/uploadFile/2020/20200103090210_20191231183804248536871.jpg",
						"chinaTitle" : "组织开展2019年跨省电力市场化交易",
						"recordDate" : "2019-09-17 16:18:02",
						"summary" : "按照省工业和信息化厅，国家能漂局东北监管局联合印发的《辽宁省2019年电力市场化交易工作方案》安排，2019年跨省电力市场化\344交易规模为240亿千瓦时",
						"centerType" : "2",
						"h5Url" : "",
						"haveMore" : "0"
					},
					{
						"menuId" : "ef750818-dcf7-11e8-ad66-000c295098d3",
						"nextMenutype" : "1",
						"objId" : "afe47edc-f86e-41a2-9503-ae35244c6ee9",
						"isComment" : "0",
						"inforSources" : "辽宁电力交易中心有限公司",
						"path" : "https://file.nepx.com/bpx/uploadFile/2019/20191217113114_007 2副本.jpg",
						"chinaTitle" : "组织工业园区内企业参加电力市场化交易的通知",
						"recordDate" : "2019-09-17 14:32:58",
						"summary" : "为进一步提高辽宁电力市场化程度，扩大交易用户覆盖面，决定鼓励工业园区内企业参加电力市场化交易。",
						"centerType" : "3",
						"h5Url" : "",
						"haveMore" : "0"
					},
					{
						"menuId" : "ef750818-dcf7-11e8-ad66-000c295098d3",
						"nextMenutype" : "1",
						"objId" : "356522b2-f633-4655-9fbd-b9e256f126d5",
						"isComment" : "0",
						"inforSources" : "福建日报",
						"path" : "https://file.nepx.com/bpx/uploadFile/2020/20200113093148_摄影作品四.jpg,https://file.nepx.com/bpx/uploadFile/2020/20200103090210_20191231183804248536871.jpg,https://file.nepx.com/bpx/uploadFile/2019/20191217113114_007 2副本.jpg",
						"chinaTitle" : "智能电网 让生活更美好（国网福建电力推进信息化、数字化建设）",
						"recordDate" : "2018-04-21 16:54:04",
						"summary" : "国网福建电力推进信息化、数字化建设",
						"centerType" : "4",
						"h5Url" : "",
						"haveMore" : "0"
					}
				],
				"haveMore" : "1"
			},
			{
				"menuId" : "fcc61c71-dcf7-11e8-ad66-000c295098d3",
				"index" : 3,
				"nextMenutype" : "2",
				"isComment" : "1",
				"chinaTitle" : "合作媒体",
				"centerType" : "1",
				"childList" : [
					{
						"menuId" : "fcc61c71-dcf7-11e8-ad66-000c295098d3",
						"nextMenutype" : "1",
						"objId" : "5dbbc843-5c99-44bd-adb9-ea76b646fd2c",
						"isComment" : "0",
						"inforSources" : "重庆电力交易中心",
						"path" : "",
						"chinaTitle" : "媒体关注",
						"recordDate" : "2019-06-20 15:11:11",
						"summary" : "媒体关注",
						"centerType" : "1",
						"h5Url" : "",
						"haveMore" : "0"
					},
					{
						"menuId" : "fcc61c71-dcf7-11e8-ad66-000c295098d3",
						"nextMenutype" : "1",
						"objId" : "5dbbc843-99-44bd-adb9-ea76b646fd2c",
						"isComment" : "0",
						"inforSources" : "重庆电力交易中心",
						"path" : "",
						"chinaTitle" : "媒体关注",
						"recordDate" : "2019-06-20 15:11:11",
						"summary" : "媒体关注",
						"centerType" : "1",
						"h5Url" : "",
						"haveMore" : "0"
					},
					{
						"menuId" : "fcc61c71-dcf7-11e8-ad66-000c295098d3",
						"nextMenutype" : "1",
						"objId" : "df8c6474-8906-4a30-a14f-fb61130b7e8f",
						"isComment" : "0",
						"inforSources" : "国家电网报 ",
						"path" : "",
						"chinaTitle" : "福建跨省外送电交易一季度成交规模达去年同期的3.7倍",
						"recordDate" : "2018-05-03 16:50:43",
						"summary" : "福建跨省外送电交易一季度成交规模达去年同期的3.7倍",
						"centerType" : "1",
						"h5Url" : "",
						"haveMore" : "0"
					}
				],
				"haveMore" : "1"
			},
			{
				"menuId" : "07bc5d7b-dcf8-11e8-ad66-000c295098d3",
				"index" : 4,
				"nextMenutype" : "2",
				"isComment" : "1",
				"chinaTitle" : "最新视频",
				"centerType" : "1",
				"childList" : [
					{
						"menuId" : "07bc5d7b-dcf8-11e8-ad66-000c295098d3",
						"nextMenutype" : "1",
						"objId" : "ac1d6690-9777-4c08-9236-7a49d82a5a04",
						"isComment" : "0",
						"inforSources" : "重庆电力交易中心",
						"path" : "https://file.nepx.com/bpx/uploadFile/2019/20191023172612_上半年市场化交易电量大增.png",
						"chinaTitle" : "(null)",
						"recordDate" : "2019-09-11 15:12:49",
						"summary" : "(null)",
						"centerType" : "2",
						"h5Url" : "",
						"haveMore" : "0"
					},
					{
						"menuId" : "07bc5d7b-dcf8-11e8-ad66-000c295098d3",
						"nextMenutype" : "1",
						"objId" : "f3a03d8b-d00d-4cd0-821f-785efdc64a61",
						"isComment" : "0",
						"inforSources" : "四川电力交易中心",
						"path" : "https://file.nepx.com/bpx/uploadFile/2019/20191023163942_国家电网：让改革释放“红利”.png",
						"chinaTitle" : "国家电网：让改革释放“红利”",
						"recordDate" : "2019-06-20 16:49:05",
						"summary" : "国家电网：让改革释放“红利”",
						"centerType" : "3",
						"h5Url" : "",
						"haveMore" : "0"
					},
					{
						"menuId" : "07bc5d7b-dcf8-11e8-ad66-000c295098d3",
						"nextMenutype" : "1",
						"objId" : "f3a03d8d00d-4cd0-821f-785efdc64a61",
						"isComment" : "0",
						"inforSources" : "四川电力交易中心",
						"path" : "https://file.nepx.com/bpx/uploadFile/2019/20191023163942_国家电网：让改革释放“红利”.png",
						"chinaTitle" : "国家电网：让改革释放“红利”",
						"recordDate" : "2019-06-20 16:49:05",
						"summary" : "国家电网：让改革释放“红利”",
						"centerType" : "3",
						"h5Url" : "",
						"haveMore" : "0"
					}
				],
				"haveMore" : "1"
			}
		],
		"listViewPages" : [
			{
				"extLink" : "https://www.baidu.com?menuId=e652dd56-dcf7-11e8-ad66-000c295098d3&chinaTitle=公司要闻&objId=31463985-a046-4c13-98a3-dbc34c12eb56",
				"path" : "https://file.nepx.com/bpx/uploadFile/2020/20200103090210_20191231183804248536871.jpg",
				"obj" : "{"objId":"31463985-a046-4c13-98a3-dbc34c12eb56","menuId":"e652dd56-dcf7-11e8-ad66-000c295098d3","chinaTitle":"公司要闻"}",
				"title" : "222222",
				"arouter" : "/app/home/news/more",
				"carouselNum" : 1
			},
			{
				"extLink" : "https://www.nepx.com/bpxgatetwayweb/pages/newsDetail/newsDetail.html?menuId=9a634518-dcfb-11e8-ad66-000c295098d3&chinaTitle=交易规则",
				"path" : "https://file.nepx.com/bpx/uploadFile/2019/20191217113114_007 2副本.jpg",
				"obj" : "{"objId":"31463985-a046-4c13-98a3-dbc34c12eb56","menuId":"9a634518-dcfb-11e8-ad66-000c295098d3","chinaTitle":"交易规则"}",
				"title" : "222222",
				"arouter" : "/app/home/news/newssub",
				"carouselNum" : 2
			},
			{
				"extLink" : "https://www.baidu.com?menuId=e652dd56-dcf7-11e8-ad66-000c295098d3&chinaTitle=公司要闻&objId=31463985-a046-4c13-98a3-dbc34c12eb56",
				"path" : "https://file.nepx.com/bpx/uploadFile/2019/20191217113114_007 2副本.jpg",
				"obj" : "{"objId":"31463985-a046-4c13-98a3-dbc34c12eb56","menuId":"e652dd56-dcf7-11e8-ad66-000c295098d3","chinaTitle":"公司要闻"}",
				"title" : "222222",
				"arouter" : "/app/h5bridge/ui/web",
				"carouselNum" : 3
			},
			{
				"extLink" : "https://www.nepx.com/bpxgatetwayweb/pages/newsDetail/newsDetail.html?menuId=e652dd56-dcf7-11e8-ad66-000c295098d3&chinaTitle=公司要闻&objId=31463985-a046-4c13-98a3-dbc34c12eb56",
				"path" : "https://file.nepx.com/bpx/uploadFile/2020/20200103090210_20191231183804248536871.jpg",
				"obj" : "{"objId":"31463985-a046-4c13-98a3-dbc34c12eb56","menuId":"e652dd56-dcf7-11e8-ad66-000c295098d3","chinaTitle":"公司要闻"}",
				"title" : "2222222",
				"arouter" : "/app/h5ridge/ui/mixweb",
				"carouselNum" : 4
			}
		]
	},
	"code" : 0
}*/