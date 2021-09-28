<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans https://www.springframework.org/schema/beans/spring-beans.xsd">
	
	<!-- Root Context: defines shared resources visible to all other web components -->
	
	<bean id="apachDataSource" class="org.apache.commons.dbcp2.BasicDataSource">
		<property name="driverClassName" value="com.mysql.cj.jdbc.Driver" />
		<property name="url" value="jdbc:mysql://localhost:3306/team3_population" />
		<property name="username" value="kdigital" />
		<property name="password" value="mysql" />
		<property name="maxIdle" value="20" />
		<property name="maxTotal" value="100" />
		<property name="maxWaitMillis" value="-1" />
	</bean>
	
	<bean id="hikariDataSource" class="com.zaxxer.hikari.HikariDataSource">
		<property name="driverClassName" value="com.mysql.cj.jdbc.Driver" />
		<property name="jdbcUrl" value="jdbc:mysql://localhost:3306/team3_population" />
		<property name="username" value="kdigital" />
		<property name="password" value="mysql" />
		<property name="minimumIdle" value="20" />
		<property name="maximumPoolSize" value="100" />
		<property name="connectionTimeout" value="10000" />
	</bean>
	
	<bean id="jdbcTemplate" class="org.springframework.jdbc.core.JdbcTemplate">
		<property name="dataSource" ref="hikariDataSource" />
	</bean>
	
	<!-- SqlSessionFactoryBean.getObject() -> SqlSessionFactory 객체를 만드는 설정 3.-->
	<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
		<property name="dataSource" ref="hikariDataSource" />
		<property name="configLocation" value="classpath:mybatis-config.xml" />
	</bean>
	
	<!-- 생성자 파라미터 sqlSessionFactory를 사용해서 SqlSession을 만들고 SqlSession을 멤버로 갖는 SqlSessionTemplate 객체 생성하는 설정 -->
	<!-- 	
	<bean id="sqlSessionTemplate" class="org.mybatis.spring.SqlSessionTemplate">
		<constructor-arg ref="sqlSessionFactory" />
	</bean>	
	 -->
	<import resource="household-context.xml" />
	<import resource="auth-context.xml"/>
	<import resource="board-context.xml"/>
		
</beans>
