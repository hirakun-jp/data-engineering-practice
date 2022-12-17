from TikTokApi import TikTokApi

verify_fp=''
api = TikTokApi(custom_verify_fp=verify_fp)

for video in api.trending.videos(count=5):
    print(video.author.username)