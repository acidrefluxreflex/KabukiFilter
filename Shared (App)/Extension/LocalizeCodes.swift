//
//  LocalizeCodes.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2022/11/10.
//

import Foundation

class LocalizeCodes {

    enum Code: String {

        case Language = "LANGUAGE"

        case Home = "HOME"
        case Creator = "CREATOR"
        case Chat = "CHAT"
        case Search = "SEARCH"
        case Setting = "SETTING"
        case Welcome = "Welcome!"

        ///AIを保存したり閲覧するにはログインが必要です
        case PleaseLogin = "PLEASELOGIN"

        ///情報を見る
        case ShowInfo = "SHOWINFO"

        ///AIを削除
        case DeleteAI = "DELETE_AI"

        ///削除は取り消せません
        case DeleteConfirm = "DELETE_CONFIRM"

        ///最近の項目
        case RecentTitle = "RECENT_TITLE"

        ///会話の履歴
        case HistoryTitle = "HISTORY_TITLE"

        ///作成済み
        case CreatedTitle = "CREATED_TITLE"

        ///画像を調整
        case FixImage = "FIX_IMAGE"

        ///画像を設定
        case SetImage = "SET_IMAGE"

        ///AIの名前
        case AIName = "AI_NAME"

        ///次へ
        case Next = "NEXT"

        ///エラー
        case Error = "ERROR"

        ///名前を入力してください
        case EmptyName = "EMPTY_NAME"

        case UnSafeWords = "UNSAFE_WORD"

        ///AIの名前
        case AvatorFormTitle = "AVATOR_FORM_TITLE"

        ///個性を決定
        case ProfileFormTitle = "PROFILE_FORM_TITLE"

        ///AIの設定を決定します。ここで入力した内容は会話に反映されます。
        case ProfileFormText = "PROFILE_FORM_TEXT"

        ///好きなこと、趣味
        case HobbyPH = "HOBBY_PH"

        ///"例：ゲーム配信、読書"
        case HobbyEX = "HOBBY_EX"

        ///職業、属性
        case WorkPH = "WORK_PH"

        ///例：お嬢様
        case WorkEX = "WORK_EX"

        ///その他設定
        case OtherPH = "OTHER_PH"

        ///例：
        case OtherEXHead = "OTHER_EX_HEAD"
        ///はお調子者
        case OtherEXFoot = "OTHER_EX_FOOT"

        ///話し方
        case Character = "CHARACTER"

        ///設定が不足しています
        case EmptyChara = "EMPTY_CHARA"

        ///AIの設定
        case SettinFormTitle = "SETTING_FORM_TITLE"
        ///AIを他の人に説明する文章を決めます。非公開にすることもできます。
        case SettingFormText = "SETTING_FORM_TEXT"

        ///説明
        case Decription = "DESCRIPTION"

        ///プライベート
        case Private = "PRIVATE"
        ///生成する
        case Generate = "GENERATE"
        ///閉じる
        case Close = "CLOSE"

        ///まだ会話がありません
        case NoConversation = "NO_CONVERSATION"

        ///トレンド
        case Trend = "TREND"

        ///ヒント
        case Hint = "HINT"

        ///New
        case New = "NEW"

        ///はじめに
        case OverView = "OVERVIEW"

        ///作成のコツ
        case ChatTips = "CHAT_TIPS"

        ///AIの探し方
        case SearchTips = "SEARCH_TIPS"

        ///AIの管理
        case EditTips = "EDIT_TIPS"

        ///会話する
        case GoToChat = "GO_TO_CHAT"

        ///完了しました
        case Complete = "COMPLETE"

        ///ご協力ありがとうございます
        case ThanksReport = "THANKS_REPORT"

        ///不適切なAIを報告します
        case ReportTitle = "REPORT_TITLE"

        ///送信
        case Send = "SEND"

        ///AIを検索
        case SearchPH = "SEARCH_PH"

        /// 自分だけのAIをつくって会話してみよう！
        case Enjoy_Tutorial = "ENJOY_TUTORIAL"

        /// 自分好みの個性をカスタマイズ\nキャラや有名人を再現してみよう
        case Character_Tutorial = "CHARACTOR_TUTORIAL"

        ///  完成したAIやその会話は共有できます！\nSNSにシェアしてみよう
        case Creator_Tutorial = "CREATOR_TUTORIAL"

        ///設定の文字数が多すぎます
        case Setting_Limit = "SETTING_LIMIT"

        ///どんなAIにする？
        case NameFormTitle = "NAME_FORM_TITLE"

        ///Evekiは日本語AIです。設定にはなるべく日本語を使用してください。
        case WarningJapanese = "WARNING_JAPANESE"
        ///設定を考えよう
        case BackSettingFormTitle = "BACK_SETTING_TITLE"

        ///どんな会話？
        case TalkCharacterFormTitle = "TALK_FORM_TITLE"

        ///AIの公開設定
        case ForPubklishFormTitle = "PUBLISH_FORM_TITLE"

        ///の職業や肩書きを教えてください
        case NFSectionOne = "NFSECTION_ONE"

        ///の趣味や好きなことは？
        case NFSectionTwo = "NFSECTION_TWO"

        ///他に設定があれば教えてください
        case NFSectionThree = "NFSECTION_THREE"

        ///どんな口調で話しますか
        case TCSectionOne = "TCSECTION_ONE"

        ///は自分のことを何と呼びますか
        case TCSectionTwo = "TCSECTION_TWO"

        ///は話し相手を何と呼びますか
        case TCSectionThree = "TCSECTION_THREE"

        ///のいいそうな一言は？
        case TCSectionFour = "TCSECTION_FOUR"

        ///の紹介文を入力してください
        case FPSectionOne = "FPSECTION_ONE"

        ///必須
        case RequiredText = "REQUIRED"

        ///ここからAIを作成できます
        case CenterSpot = "CENTER_SPOT"
        ///作成済みのAIはここに保存されます
        case CreatorSpot = "CREATOR_SPOT"
        ///その他の使い方はこちらから
        case HomeSpot = "HOME_SPOT"

        ///選べるキャラが10個に！
        case PremiumFunctionSectionTitle1 = "PremiumFunctionSectionTitle1"

        ///選べるAIの口調が**5から10**になります。ひかえめや関西弁などより多くのカスタマイズを使用できます。
        case PremiumFunctionSectionText1 = "PremiumFunctionSectionText1"

        ///会話を記憶させられる
        case PremiumFunctionSectionTitle2 = "PremiumFunctionSectionTitle2"

        ///以前行った会話の記憶を保存して引き継ぐ事ができます。これによってより親密な会話を楽しむ事ができます。
        case PremiumFunctionSectionText2 = "PremiumFunctionSectionText2"

        ///AIの再設定が可能に
        case PremiumFunctionSectionTitle3 = "PremiumFunctionSectionTitle3"

        ///作成済みのAIに対して自由に再設定ができるようになります。口調や趣味なども後から変更可能になります。
        case PremiumFunctionSectionText3 = "PremiumFunctionSectionText3"

        case PremiumTableImage = "PremiumTableImage"

        case MemoryViewTitle = "MemoryViewTitle"

        case MasterPlan = "MASTERPLAN"

        case MasterPrice = "MASTER_PRICE"

        case PlanEnjoy = "PLAN_ENJOY"

        case SubscriptionInfo = "SUBSCRIPTION_INFO"

        case Subscribe = "SUBSCRIBE"

        case UpgradePlan = "UPGRADE_PLAN"

        case SelectLanguage = "SELECT_LANGUAGE"
case PleaseUpgrade = "PLEASE_UPGRADE"
        case Lady = "LADY"
        case Friend = "FRIEND"
        case Robot = "ROBOT"
        case King = "KING"
        case Fairly = "FAIRLY"
        case Marisa = "MARISA"
        case Bocchi = "BOCCHI"
        case Kansai = "KANSAI"
        case Tundere = "TUNDERE"
        case Professor = "PROFESSER"
        case ExampleWork = "EXAMPLE_WORK"
        case ExampleHobby = "EXAMPLE_HOBBY"
        case ExampleFirst = "EXAMPLE_FIRST"
        case ExampleSecond = "EXAMPLE_SECOND"
        
        case ExampleSetting = "EXAMPLE_SETTING"
        case Contact = "CONTACT"
        case PrivateInfo = "PRIVATE_INFO"
        
        case ShareCard = "SHARE_CARD"
        case CompleteCreate = "COMPLETE_CREATE"
        case SharePrompt = "SHARE_PROMPT"
    }

    func text(_ code: Code) -> String {
        return code.rawValue.localized
    }
}
