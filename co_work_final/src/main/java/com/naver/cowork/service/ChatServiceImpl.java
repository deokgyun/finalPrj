package com.naver.cowork.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.naver.cowork.domain.ChatVO;
import com.naver.cowork.mybatis.mapper.ChatMapper;

@Repository
public class ChatServiceImpl implements ChatService{
	
		
		@Autowired
		private SqlSession session;
		
		private String namespace = "com.naver.cowork.mybatis.mapper.ChatMapper";


		@Override
		public List<ChatVO> list() {
			return session.selectList(namespace + ".list");
		}

		@Override
		public void insert(ChatVO vo) {
			session.insert(namespace + ".insert", vo);
		}

		@Override
		public List<ChatVO> getChatList() {
			return session.selectList(namespace + ".getChatList");
		}
		
}