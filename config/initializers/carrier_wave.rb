if Rails.env.production?
    CarrierWave.configure do |config|
      config.fog_credentials = {
        # Amazon S3用の設定
        :provider              => 'AWS',
        :region                => ENV['ap-northeast-1'],
        :aws_access_key_id     => ENV['AKIA5XUHJL2PUGYUYGP7'],
        :aws_secret_access_key => ENV['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']
      }
      config.fog_directory     =  ENV['takuyakun']
    end
  end