# encoding: utf-8
module WeixinAuthorize
  module Api
    module Groups

      # 创建分组
      # https://api.weixin.qq.com/cgi-bin/groups/create?access_token=ACCESS_TOKEN
      def create_group(group_name)
        create_url = "#{group_base_url}/create?#{access_token_param}"
        group = MultiJson.dump({group: {name: group_name}})
        JSON.parse(RestClient.post(create_url, group))
      end

      # 查询所有分组
      # https://api.weixin.qq.com/cgi-bin/groups/get?access_token=ACCESS_TOKEN
      def groups
        groups_url = "#{group_base_url}/get?#{access_token_param}"
        JSON.parse(RestClient.get(groups_url))
      end

      # 查询用户所在分组
      # https://api.weixin.qq.com/cgi-bin/groups/getid?access_token=ACCESS_TOKEN
      def get_group_for(openid)
        group_url = "#{group_base_url}/getid?#{access_token_param}"
        openid = MultiJson.dump({openid: openid})
        JSON.parse(RestClient.post(group_url, openid))
      end

      # 修改分组名
      # https://api.weixin.qq.com/cgi-bin/groups/update?access_token=ACCESS_TOKEN
      def update_group_name(group_id, new_group_name)
        group_url = "#{group_base_url}/update?#{access_token_param}"
        group = MultiJson.dump({group: {id: openid, name: new_group_name}})
        JSON.parse(RestClient.post(group_url, group))
      end

      # 移动用户分组
      # https://api.weixin.qq.com/cgi-bin/groups/members/update?access_token=ACCESS_TOKEN
      def update_group_for_openid(openid, to_groupid)
        group_url = "#{group_base_url}/members/update?#{access_token_param}"
        group = MultiJson.dump({openid: openid, to_groupid: to_groupid})
        JSON.parse(RestClient.post(group_url, group))
      end

      private

        def group_base_url
          "#{endpoint}/groups"
        end

    end
  end
end