import 'dart:convert';

import 'package:chou_jiang/config/config.dart';
import 'package:chou_jiang/data/question_bean.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

class AnswerWidget extends StatefulWidget {
  const AnswerWidget({Key? key}) : super(key: key);

  @override
  State<AnswerWidget> createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  QuestionBean? _selectQuestion;
  String _content =
      '入党誓词：我志愿加入中国共产党，拥护党的纲领，遵守党的章程，履行党员义务，执行党的决定，严守党的纪律，保守党的秘密，对党忠诚，积极工作，为共产主义奋斗终身，随时准备为党和人民牺牲一切，（  ）。';
  int index = 0;
  String _cmdContent = '开始';
  final _list = <QuestionBean>[];
  final _selectList = <QuestionBean>[];
  final timeout = const Duration(milliseconds: 500);
  Timer? _timer;
  String _answer = '***';
  @override
  void initState() {
    super.initState();
    const json =
        '[{"no":1,"question":"《党章》指出党的根本组织原则是？","answer":"民主集中制","checked":false},{"no":2,"question":"《党章》指出，我们党最大的政治优势是？","answer":"密切联系群众","checked":false},{"no":3,"question":"入党介绍人必须是什么党员？","answer":"正式党员","checked":false},{"no":4,"question":"中国共产党的象征和标志是？","answer":"党徽党旗","checked":false},{"no":5,"question":"党的全国代表大会每几年举行一次？","answer":"5年","checked":false},{"no":6,"question":"中国共产党党徽为（ ）组成的图案。","answer":"镰刀和锤头","checked":false},{"no":7,"question":"中国共产党的宗旨是？","answer":"全心全意为人民服务","checked":false},{"no":8,"question":"中国共产党的三大优良作风是？","answer":"理论联系实际，密切联系群众，批评和自我批评","checked":false},{"no":9,"question":"7月1日是什么节？","answer":"建党节","checked":false},{"no":10,"question":"5月4日是什么节？","answer":"青年节","checked":false},{"no":11,"question":"8月1日是什么节？","answer":"建军节","checked":false},{"no":12,"question":"中国共产党成立时间？","answer":"1921年","checked":false},{"no":13,"question":"6月份主题党日活动主题？","answer":"“七一”忆初心，暖心齐行动","checked":false},{"no":14,"question":"中华人民共和国政府对香港行使主权是在哪一年？","answer":"1997年","checked":false},{"no":15,"question":"中华人民共和国政府对澳门行使主权是在哪一年？","answer":"1999年","checked":false},{"no":16,"question":"我国加快实现工业化和现代化的必然选择是（  ）？","answer":"信息化","checked":false},{"no":17,"question":"民事主体在民事活动中的法律地位一律平等。（判断）","answer":"对","checked":false},{"no":18,"question":"中华人民共和国领域内的民事活动，适用什么法律？","answer":"中华人民共和国法律","checked":false},{"no":19,"question":"我国实行婚姻自由、一夫一妻、男女平等的婚姻制度。（判断）","answer":"对","checked":false},{"no":20,"question":"根据《中华人民共和国民法典》，夫妻双方到民政部门协议离婚，当天就能拿到离婚证。（判断）","answer":"错","checked":false},{"no":21,"question":"15.子女对父母的赡养义务，自父母的婚姻关系发生变化时终止。（判断）","answer":"错","checked":false},{"no":22,"question":"公司发薪日为每月（ ）号","answer":15,"checked":false},{"no":23,"question":"总公司现有几个部门？分别是什么？","checked":false},{"no":24,"question":"公司出勤时间为？","answer":"8:00-11:30，14:30-17:30","checked":false},{"no":25,"question":"夏季空调温度不低于（）度？","answer":26,"checked":false},{"no":26,"question":"迟到、早退5次以上，每迟到早退一次扣（）元？","answer":30,"checked":false},{"no":27,"question":"工作人员妻子生育，男方享受（ ）天护理假","answer":30,"checked":false},{"no":28,"question":"司员工请假1天的，由（   ）审批？","answer":"部门负责人","checked":false},{"no":29,"question":"公司员工请假2-4天的，由（   ）审批？","answer":"分管领导","checked":false},{"no":30,"question":"公司员工请假5天以上的，由（   ）审批？","answer":"总经理","checked":false},{"no":31,"question":"不请假脱岗超过半天的视为（）？","answer":"旷工","checked":false},{"no":32,"question":"公司设立党总支委员会、董事会、监事会和（）？","answer":"经理层","checked":false},{"no":33,"question":"公司员工被效能督查发现缺岗等违规违纪的，第一次罚款（）元，第二次发现罚款（）元；","answer":"600元1000元","checked":false},{"no":34,"question":"钉钉考勤缺卡，每次扣除绩效工资（）元？","answer":"50元","checked":false},{"no":35,"question":"已满1年不满10年的员工可享年休假（）天？","answer":"5天","checked":false},{"no":36,"question":"对党员的纪律处分种类有：1.警告;2.严重警告;3.撤销党内职务;4.留党察看;5.（)?","answer":"开除党籍","checked":false},{"no":37,"question":"（党章）是最根本的党内法规，是管党治党的总规矩。（  ）是党的各级组织和全体党员必须遵守的行为规则。","answer":"党的纪律","checked":false},{"no":38,"question":"中华人民共和国公民有维护国家的安全、荣誉和利益的义务，不得有危害国家的安全、荣誉和利益的行为。（判断）","answer":"对","checked":false},{"no":39,"question":"党的十八大以来，以习近平同志为主要代表的中国共产党人，顺应时代发展，从理论和实践结合上系统回答了新时代坚持和发展什么样的中国特色社会主义、怎样坚持和发展中国特色社会主义这个重大时代课题，创立了（）思想？","answer":"习近平新时代中国特色社会主义思想","checked":false},{"no":40,"question":"不忘初心，方得始终。中国共产党人的初心和使命，就是为中国人民谋幸福，为（）谋复兴","answer":"中华民族","checked":false},{"no":41,"question":"实现（）伟大复兴，是近代以来中华民族最伟大的梦想。","answer":"中华民族","checked":false},{"no":42,"question":"中国共产党一经成立，就把实现（）主义作为党的最高理想和最终目标。","answer":"共产","checked":false},{"no":43,"question":"（  ）理论体系，是指导党和人民实现中华民族伟大复兴的正确理论。","answer":"中国特色社会主义","checked":false},{"no":44,"question":"党的十九大报告指出，我们党深入贯彻（）的发展思想，一大批惠民举措落地实施，人民获得感显著增强。","answer":"以人民为中心","checked":false},{"no":45,"question":"党的十九大报告指出，（）是中国特色社会主义的本质要求和重要保障。","answer":"全面依法治国","checked":false},{"no":46,"question":"党的十九大报告指出，（）原则是两岸关系的政治基础。","answer":"一个中国","checked":false},{"no":47,"question":"《党章》指出，我们都党最大的政治优势是（密切联系群众），党执政后最大的危险是（）","answer":"脱离群众","checked":false},{"no":48,"question":"《党章》指出，要坚持把纪律挺在前面，加强组织性纪律性，在党的纪律面前（）。","answer":"人人平等","checked":false},{"no":49,"question":"《党章》规定，各基层单位，凡是有正式党员（）以上的，都应当成立党的基层组织。","answer":"3人","checked":false},{"no":50,"question":"《党章》规定，党的基层委员会、总支部委员会、支部委员会每届任期（）。","answer":"三年至五年","checked":false},{"no":51,"question":"党支部对党员的纪律处分，必须经过（）讨论决定，报党的基层委员会批准.","answer":"支部大会","checked":false},{"no":52,"question":"全党必须毫不动摇坚持以（）为中心，聚精会神抓好（发展）这个党执政兴国的第一要务。","answer":"经济建设","checked":false},{"no":53,"question":"每个党员，不论职务高低，都必须接受党内外群众的监督（判断）","answer":"对","checked":false},{"no":54,"question":"我国处理民族关系的一项重要政治制度，是在少数民族地区实行（    ）","answer":"民族区域自治","checked":false},{"no":55,"question":"党章规定，党的最高领导机关是党的全国代表大会和他所产生的（）","answer":"中央委员会","checked":false},{"no":56,"question":"党的四项基本要求坚持（党的基本路线）；坚持（解放思想，实事求是）；坚持（全心全意为人民服务）；坚持（）","answer":"民主集中制","checked":false},{"no":57,"question":"两个一百年是到中国共产党成立100年时全面建成小康社会，到新中国成立（）年时建成富强、民主、文明、和谐的社会主义现代化国家。","answer":100,"checked":false},{"no":58,"question":"党的七大是中国共产党在民主革命时期召开的极其重要的一次、也是最后一次代表大会。它的一个重大历史性贡献是确立（）思想为党的指导思想并写入党章。","answer":"毛泽东","checked":false},{"no":59,"question":"1921年7月，中国共产党第一次全国代表大会在上海召开期间，由于受到暗探侦察和巡捕骚扰，大会最后一天的会议转移到（）举行。","answer":"嘉兴南湖","checked":false},{"no":60,"question":"中国共产党的三大作风是理论联系实际、密切联系群众和（）","answer":"批评与自我批评","checked":false},{"no":61,"question":"党员如果没有正当理由，连续3个月不参加党的组织生活，或不交纳党费，或不做党所分配的工作，就被认为是自行脱党。（判断）","answer":"错，6个月","checked":false},{"no":62,"question":"对于严重触犯刑律的党员，必须开除党籍。（判断）","answer":"对","checked":false},{"no":63,"question":"党的十九大的主题是：高举中国特色社会主义伟大旗帜，决胜全面建成小康社会，夺取新时代中国特色社会主义伟大胜利，为实现（）的中国梦不懈奋斗。","answer":"中华民族伟大复兴","checked":false},{"no":64,"question":"坚决维护习近平总书记党中央的核心、（）地位，必须切实增强、大局意识、看齐意识，自觉同以xjp同志为核心的党中央保持高度一致，在思想上高度认同，政治上坚决维护，组织上自觉服从，行动上紧紧跟随。","answer":"全党核心","checked":false},{"no":65,"question":"坚持党的领导、加强（）建设是国有企业的“根”和“魂”","answer":"加强党的建设","checked":false},{"no":66,"question":"正式党员（ ）人以上的党支部，设立支部委员会","answer":7,"checked":false},{"no":67,"question":"工龄已满10年不满20年的，享受年休假（）天？","answer":"10天","checked":false},{"no":68,"question":"上班迟到、早退，月度合并累计3次（含3次）以上，每超过一次扣除绩效工资30元；10次以上的，直接扣除（）绩效工资；","answer":"当月","checked":false},{"no":69,"question":"参加公司会议，不遵守会议纪律（如无故迟到、早退、睡觉、玩手机等）被主持人点名的，每次扣除绩效工资（）元；","answer":30,"checked":false},{"no":70,"question":"被县级（含）以上效能检查部门通报的第一次扣除绩效工资600元；第二次留用察看一个月，扣除绩效工资（）元，","answer":1000,"checked":false},{"no":71,"question":"改革开放是决定当代中国前途命运的关键一招，（）是指引中国发展繁荣的正确道路","answer":"中国特色社会主义道路","checked":false},{"no":72,"question":"四史是指：社会主义发展史、新中国史、改革开放史和（）","answer":"党史","checked":false},{"no":73,"question":"红船精神：开天辟地，（）","answer":"敢为人先","checked":false},{"no":74,"question":"中国共产党创立的第一块农村革命根据地是：（）革命根据地。","answer":"井冈山","checked":false},{"no":75,"question":"红军长征1934年10起至（）年10止。","answer":"1936年","checked":false},{"no":76,"question":"“三会一课”指：","checked":false},{"no":77,"question":"三严三实”:严以修身、严以用权、严以律己；谋事要实、创业要实、(  )。","answer":"做人要实","checked":false},{"no":78,"question":"四个意识：是指政治意识、大局意识、核心意识、（）","answer":"看齐意识","checked":false},{"no":79,"question":"四个全面：即全面建成小康社会、全面深化改革、全面依法治国、（）","answer":"全面从严治党","checked":false},{"no":80,"question":"四个自信：中国特色社会主义道路自信、理论自信、制度自信、（）。","answer":"文化自信","checked":false},{"no":81,"question":"五大发展理念：创新、协调、绿色、开放 、（）。","answer":"共享","checked":false},{"no":82,"question":"两个“一以贯之”：坚持（）对国有企业的领导是重大政治原则，必须一以贯之；建立现代企业制度是国有企业改革的方向，也必须一以贯之","answer":"党","checked":false},{"no":83,"question":"党的行动指南：中国共产党以马克思列宁主义、毛泽东思想、邓小平理论、“三个代表”重要思想、科学发展观、（）作为自己的行动指南。","answer":"习近平新时代中国特色社会主义思想","checked":false},{"no":84,"question":"入党誓词：我志愿加入中国共产党，拥护党的纲领，遵守党的章程，履行党员义务，执行党的决定，严守党的纪律，保守党的秘密，对党忠诚，积极工作，为共产主义奋斗终身，随时准备为党和人民牺牲一切，（  ）。","answer":"永不叛党","checked":false},{"no":85,"question":"党的“三大优良作风”：理论联系实际、密切联系群众、（）。","answer":"批评和自我批评","checked":false},{"no":86,"question":"“两学一做”学习教育：学党章党规、学系列讲话，做(  )。","answer":"合格党员","checked":false},{"no":87,"question":"两个维护:坚决维护(  )党中央的核心、全党的核心地位，坚决维护党中央权威和集中统一领导。","answer":"习近平总书记","checked":false},{"no":88,"question":"四大危险:精神懈怠危险、能力不足危险、(  )、消极腐败危险。","answer":"脱离群众危险","checked":false},{"no":89,"question":"四风问题:形式主义、官僚主义、享乐主义、(  )。","answer":"奢靡之风","checked":false},{"no":90,"question":"推进党的作风建设的核心:保持党同(  )的血肉联系。","answer":"人民群众","checked":false},{"no":91,"question":"十九大报告提出的4个伟大：伟大斗争、伟大工程、伟大事业和（）。","answer":"伟大梦想","checked":false},{"no":92,"question":"安全生产方针:安全第一、（）、综合治理。","answer":"预防为主","checked":false},{"no":93,"question":"今年是中国共产党成立多少年？","answer":"101周年","checked":false},{"no":94,"question":"今年是中华人民共和国成立多少年？","answer":"73周年","checked":false},{"no":95,"question":"中国共产党全国代表大会每（）年举行一次？今年是第几次？","answer":"5年，20次","checked":false},{"no":96,"question":"中国共产党的中央机关报是（）？","answer":"《人民日报》","checked":false},{"no":97,"question":"中国共产党党刊为（）杂志","answer":"《求是》","checked":false},{"no":98,"question":"两会是指？","answer":"全国人民代表大会和中国人民政治协商会议","checked":false},{"no":99,"question":"今年6月是第（）个全国安全生产月？","answer":"21","checked":false},{"no":100,"question":"2022年秋季，召开党的第几次代表大会？","answer":"20","checked":false}]';
    List listDynamic = jsonDecode(json) as List;
    _list.addAll(listDynamic
        .map((e) => QuestionBean.fromJson(e as Map<String, dynamic>))
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Config.loadAppbar('答题'),
      body: Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Text( ''),
                  Container(
                    width: 666.w,
                    height: 444.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.sp,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 333.h,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _content,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 30.sp,
                                ),
                              ),
                              Opacity(
                                opacity: _cmdContent == '开始' ? 1 : 0,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Spacer(flex: 1),
                                    InkWell(
                                        onTap: () {
                                          if (_timer == null) {
                                            setState(() {
                                              _answer = _selectQuestion!.answer
                                                  .toString();
                                            });
                                          }
                                        },
                                        child: const Text('答案：')),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(_answer),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (_timer == null) {
                              startTime();
                              setState(() {
                                _cmdContent = '暂停';
                                _answer = '***';
                              });
                            } else {
                              stopTime();
                              setState(() {
                                _cmdContent = '开始';
                              });
                            }
                          },
                          style: Config.loadPerformButtonStyle(),
                          child: Text(_cmdContent),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              width: 666.w,
              child: Text(
                  "答题数量:${_selectList.length}/${_selectList.length + _list.length}"),
            ),
          ],
        ),
      ),
    );
  }

  void startTime() {
    _timer ??= Timer.periodic(timeout, callback);
  }

  void callback(Timer timer) {
    //更新_content
    QuestionBean bean = _list[index];
    setState(() {
      _content = "${bean.no!}.${bean.question!}";
      _selectQuestion = bean;
      if (index >= _list.length - 1) {
        index = -1;
      }
      index += 1;
    });
  }

  void stopTime() {
    _timer?.cancel();
    _timer = null;
    if (null != _selectQuestion) {
      _selectList.add(_selectQuestion!);
      _list.remove(_selectQuestion!);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }
}
