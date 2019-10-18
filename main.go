package main

import (
	"net/http"
	"sync"
	"log"
	"time"
)


func main() {
	url := "http://localhost:8080"

	resp, err := http.Get(url)		// GETリクエストでアクセスするよ！
		if err != nil {					// err ってのはエラーの時にエラーの内容が入ってくるよ！
				return						// 回線が狭かったりするとここでエラーが帰ってくるよ！
			}
			defer resp.Body.Close() 		// 関数が終了するとなんかクローズするよ！（おまじない的な）

			count++							// アクセスが成功したことをカウントするよ！
			<-maxConnection					// ここは並列する数を抑制する奴だよ！詳しくはググって！
		}
	}
	wg.Wait()								// ここは便利な奴が並列処理が終わるのを待つよ！
	end := time.Now()						// 処理にかかった時間を測定するよ！
	log.Printf("%d 回のリクエストに成功しました！\n", count)	// 成功したリクエストの数を表示してくれるよ！
	log.Printf("%f 秒処理に時間がかかりました！\n",(end.Sub(start)).Seconds())			//何秒かかったかを表示するよ！
}