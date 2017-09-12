#!/usr/bin/env python
# -*- coding:utf-8 -*-

__author__ = 'hiroki-m'

from kokemomo.plugins.engine.controller.km_exception import log as log_error
from application.plugins.project_management.model.pm_task import PMTask
from kokemomo.plugins.engine.controller.km_engine import KMEngine
from kokemomo.settings import SETTINGS

'''

'''

class ProjectManagement(KMEngine):


    def get_name(self):
        return 'task'


    def get_route_list(self):
        list = super(ProjectManagement, self).get_route_list() # import admin route list
        list = list + (
            {'rule': '/task', 'method': 'GET', 'target': self.pm_task},
            {'rule': '/task/edit', 'method': 'GET', 'target': self.pm_task_edit},
            {'rule': '/task/save', 'method': 'POST', 'target': self.pm_task_save},
        )
        return list

    @log_error
    @KMEngine.action('application/plugins/project_management/view/pm_task_list')
    def pm_task(self):
        '''
        '''
        self.result['tasks'] = PMTask.all()


    @KMEngine.action('application/plugins/project_management/view/pm_task_detail')
    def pm_task_edit(self):
        '''
        '''
        pm_task_id = self.data.get_request_parameter('pm_task_id', default=None)
        self.result['task'] = PMTask.get(id=pm_task_id)


    @KMEngine.action('application/plugins/project_management/view/pm_task_list')
    def pm_task_save(self):
        '''
        '''
        id = self.data.get_request_parameter('id', default=None)
        delete = self.data.get_request_parameter("delete", default=None)
        if delete:
            PMTask.delete_by_id(id)
        else:
            PMTask.save_data(id, self.data)
        self.result['tasks'] = PMTask.all()
