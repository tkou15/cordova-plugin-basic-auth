#import "BasicAuth.h"

/// cordova-plugin-wkwebview-engineをカテゴリ拡張し、delegateを追加
@implementation CDVWKWebViewEngine (BasicAuth)

- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler {
    NSDictionary *settings = self.commandDelegate.settings;
    NSString *basicAuthUser = [settings cordovaSettingForKey:@"BasicAuthUser"];
    NSString *basicAuthPass = [settings cordovaSettingForKey:@"BasicAuthPass"];

    NSURLSessionAuthChallengeDisposition disposition = NSURLSessionAuthChallengeUseCredential;
    NSURLCredential *credential = [NSURLCredential credentialWithUser: basicAuthUser password: basicAuthPass persistence:NSURLCredentialPersistencePermanent];
    completionHandler(disposition, credential);
}

@end
