--
-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file--
--  distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"). You may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
--  http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the License is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
-- KIND, either express or implied.  See the License for the
-- specific language governing permissions and limitations
-- under the License.
--

-- This schema extends version 1.1.0 with partition statistics storage support
-- The partition_statistic_meta table stores partition-level statistics for tables

CREATE TABLE IF NOT EXISTS partition_statistic_meta (
    table_id BIGINT NOT NULL COMMENT 'table id from table_meta',
    partition_name VARCHAR(1024) NOT NULL COMMENT 'partition name',
    statistic_name VARCHAR(128) NOT NULL COMMENT 'statistic name',
    statistic_value CLOB NOT NULL COMMENT 'statistic value as JSON',
    audit_info CLOB NOT NULL COMMENT 'audit information as JSON',
    created_at BIGINT NOT NULL COMMENT 'creation timestamp in milliseconds',
    updated_at BIGINT NOT NULL COMMENT 'last update timestamp in milliseconds',
    PRIMARY KEY (table_id, partition_name, statistic_name)
);

CREATE INDEX IF NOT EXISTS idx_table_partition ON partition_statistic_meta(table_id, partition_name);
