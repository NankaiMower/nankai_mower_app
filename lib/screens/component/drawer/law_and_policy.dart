import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LawAndPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 使用 TextSpan 来创建包含多个段落的富文本
    final richText = TextSpan(
      children: <TextSpan>[
        TextSpan(
          text: '\n\n',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextSpan(
          text: '\n\n',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextSpan(
          text: 'This is the second paragraph. You can continue to add more paragraphs '
              'as needed to provide comprehensive information to your users.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextSpan(
          text: '\n\nLegal Information\n\n',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextSpan(
          text: 'Here is the first paragraph of your copyright and legal information. '
              'It can contain details about your app\'s policies, terms of service, '
              'and any other relevant legal information.\n\n',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextSpan(
          text: 'This is the second paragraph. You can continue to add more paragraphs '
              'as needed to provide comprehensive information to your users.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextSpan(
          text: '\n\nCopyright\n\n',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextSpan(
          text: 'Here is the first paragraph of your copyright and legal information. '
              'It can contain details about your app\'s policies, terms of service, '
              'and any other relevant legal information.\n\n',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextSpan(
          text: 'This is the second paragraph. You can continue to add more paragraphs '
              'as needed to provide comprehensive information to your users.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextSpan(
          text: '\n\nLegal Information\n\n',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextSpan(
          text: 'Here is the first paragraph of your copyright and legal information. '
              'It can contain details about your app\'s policies, terms of service, '
              'and any other relevant legal information.\n\n',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextSpan(
          text: 'This is the second paragraph. You can continue to add more paragraphs '
              'as needed to provide comprehensive information to your users.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Law and Policy'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FractionallySizedBox(
                widthFactor: 0.5, // 设置宽度为屏幕宽度的50%
                child: Image.asset('sources/icon.png'),
              ),
              Container(
                child: Text(
                  'Copyright',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    height: 1,
                  ),
                ),
                margin: EdgeInsetsDirectional.only(bottom: 10),
              ),
              Text(
                'Here is the first paragraph of your copyright and legal information. '
                'It can contain details about your app\'s policies, terms of service, '
                'and any other relevant legal information. \n'
                'This is the second paragraph. You can continue to add more paragraphs '
                'as needed to provide comprehensive information to your users.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5, //1倍行高
                ),
              ),
              Container(
                child: Text(
                  'Legal Information',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    height: 1,
                  ),
                ),
                margin: EdgeInsetsDirectional.only(top: 20, bottom: 10),
              ),
              Text(
                'Here is the first paragraph of your copyright and legal information. '
                    'It can contain details about your app\'s policies, terms of service, '
                    'and any other relevant legal information. \n'
                    'This is the second paragraph. You can continue to add more paragraphs '
                    'as needed to provide comprehensive information to your users.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5, //1倍行高
                ),
              ),
              Container(
                child: Text(
                  'Copyright',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    height: 1,
                  ),
                ),
                margin: EdgeInsetsDirectional.only(top: 20, bottom: 10),
              ),
              Text(
                'Here is the first paragraph of your copyright and legal information. '
                    'It can contain details about your app\'s policies, terms of service, '
                    'and any other relevant legal information. \n'
                    'This is the second paragraph. You can continue to add more paragraphs '
                    'as needed to provide comprehensive information to your users.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5, //1倍行高
                ),
              ),
              Container(
                child: Text(
                  'Legal Information',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    height: 1,
                  ),
                ),
                margin: EdgeInsetsDirectional.only(top: 20, bottom: 10),
              ),
              Text(
                'Here is the first paragraph of your copyright and legal information. '
                    'It can contain details about your app\'s policies, terms of service, '
                    'and any other relevant legal information. \n'
                    'This is the second paragraph. You can continue to add more paragraphs '
                    'as needed to provide comprehensive information to your users.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5, //1倍行高
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}