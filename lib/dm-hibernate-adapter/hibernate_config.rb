CUSTOMER = <<CUSTOMER
<?xml version="1.0"?>
<!DOCTYPE hibernate-mapping PUBLIC
"-//Hibernate/Hibernate Mapping DTD 3.0//EN"
"http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd">

<hibernate-mapping package="ruby">

<class name="Customer.rb..rb." table="customer" catalog="exercise">
        <id name="id" type="java.lang.Integer">
            <column name="id" />
            <generator class="native" />
        </id>
        <property name="name" type="java.lang.String">
            <column name="name" length="20" not-null="true" />
        </property>
        <property name="birthday" type="java.util.Date">
            <column name="birthday" length="10" not-null="true" />
        </property>
    </class>

</hibernate-mapping>
CUSTOMER

HBXML = <<HBXML
<?xml version='1.0' encoding='utf-8'?>
<!DOCTYPE hibernate-configuration PUBLIC
"-//Hibernate/Hibernate Configuration DTD 3.0//EN"
"http://hibernate.sourceforge.net/hibernate-configuration-3.0.dtd">

<hibernate-configuration>

<session-factory>
        <property name="connection.driver_class">com.mysql.jdbc.Driver</property>
        <property name="connection.url">jdbc:mysql://localhost:3306/exercise</property>
        <property name="connection.username">root</property>
        <property name="connection.password">root</property>

        <property name="connection.pool_size">1</property>

        <property name="dialect">org.hibernate.dialect.MySQL5Dialect</property>

        <property name="current_session_context_class">thread</property>

        <property name="cache.provider_class">org.hibernate.cache.NoCacheProvider</property>

        <property name="show_sql">false</property>

        <property name="hbm2ddl.auto">update</property>

        <mapping resource="Customer.rb..rb..hbm.xml"/>
</session-factory>

</hibernate-configuration>
HBXML