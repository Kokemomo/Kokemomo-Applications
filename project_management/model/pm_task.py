#!/usr/bin/env python
# -*- coding:utf-8 -*-
from kokemomo.plugins.engine.utils.km_model_utils import *
from kokemomo.plugins.engine.model.km_storage.impl.km_rdb_adapter import adapter
from kokemomo.plugins.engine.model.km_validate_error import KMValidateError

__author__ = 'hiroki'

"""
"""


class PMTask(adapter.Model):
    __tablename__ = 'pm_task'
    id = adapter.Column(adapter.Integer, autoincrement=True, primary_key=True)
    category = adapter.Column(adapter.Text)
    target = adapter.Column(adapter.Text)
    contents = adapter.Column(adapter.Text)
    faze = adapter.Column(adapter.Text)
    remarks = adapter.Column(adapter.Text)

    def __init__(self, data=None):
        if data is None:
            self.category = ''
            self.target = ''
            self.contents = ''
            self.faze = ''
            self.remarks = ''
        else:
            self.set_data(data)

    def __repr__(self):
        return create_repr_str(self)

    def get_json(self):
        return create_json(self)


    def set_data(self, data):
        self.error = None
        self.category = data.get_request_parameter('category', default='')
        self.target = data.get_request_parameter('target', default='')
        self.contents = data.get_request_parameter('contents', default='')
        self.faze = data.get_request_parameter('faze', default='')
        self.remarks = data.get_request_parameter('remarks', default='')

    def validate(self):
        self.error = KMValidateError()
        if self.error.size() == 0:
            return True
        else:
            return False

    @classmethod
    def get(cls, id):
        if id is None:
            info = PMTask()
        else:
            info = super(PMTask, cls).get(id=id)
        return info

    @classmethod
    def save_data(cls, id, data):
        if id is None:
            info = PMTask(data)
        else:
            info = PMTask.get(id=id)
            info.set_data(data)
        if info.validate():
            info.save()
        return info